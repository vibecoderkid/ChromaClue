//
//  GameViewModel.swift
//  ChromaClue
//
//  Created by Vedant Saxena on 10/28/25.
//

import SwiftUI
import Combine
import UIKit // Needed for Haptics

/// The "brains" of the game, this class manages all game state and logic.
@MainActor // Ensures all UI updates happen on the main thread
class GameViewModel: ObservableObject {
    
    // --- Game Data ---
    /// The master list of all 54 tiles
    let allTiles: [ChromaTile] = TileData.tiles
    
    // --- Game State Properties ---
    /// The correct tile the user is trying to guess
    @Published var correctAnswer: ChromaTile?
    
    /// The tile the user last tapped on
    @Published var lastGuess: ChromaTile?

    /// The hint currently being displayed
    @Published var currentHint: String = ""
    
    /// How many guesses the user has left
    @Published var guessesLeft: Int = 0
    
    /// The "Hot/Cold" or "Win/Loss" message
    @Published var feedbackMessage: String = ""
    
    /// The current status of the game
    @Published var gameState: GameState = .playing
    
    // --- Score / Streak Properties ---
    @Published var currentStreak: Int = 0
    @Published var bestStreak: Int = UserDefaults.standard.integer(forKey: "ChromaClue_BestStreak")
    
    // --- Animation State ---
    /// The ID of the tile that should currently be shaking (if wrong guess)
    @Published var shakingTileId: UUID?
    
    enum GameState {
        case playing, won, lost
    }

    // --- Constants ---
    let totalGuesses = 3
    
    // --- Initializer ---
    init() {
        startNewRound()
    }
    
    /// Resets the game board for a new round
    func startNewRound() {
        correctAnswer = allTiles.randomElement()
        currentHint = correctAnswer?.hints.randomElement() ?? "No hint found"
        
        guessesLeft = totalGuesses
        feedbackMessage = "Guesses left: \(guessesLeft)"
        gameState = .playing
        lastGuess = nil
        shakingTileId = nil
    }
    
    /// Processes a user's guess
    func makeGuess(guessedTile: ChromaTile) {
        guard gameState == .playing else { return }
        
        // Prevent spamming the same wrong tile while it's shaking
        if shakingTileId == guessedTile.id { return }
        
        lastGuess = guessedTile
        guessesLeft -= 1
        
        // --- 1. Check for a WIN ---
        if guessedTile == correctAnswer {
            gameState = .won
            feedbackMessage = "You got it!"
            triggerHaptic(type: .success) // <--- SUCCESS HAPTIC
            
            currentStreak += 1
            if currentStreak > bestStreak {
                bestStreak = currentStreak
                UserDefaults.standard.set(bestStreak, forKey: "ChromaClue_BestStreak")
            }
            return
        }
        
        // --- 2. Check for a LOSS ---
        if guessesLeft == 0 {
            gameState = .lost
            triggerHaptic(type: .error) // <--- ERROR HAPTIC
            
            currentStreak = 0
            
            if let answer = correctAnswer, let finalGuess = lastGuess {
                let similarity = Color.similarityPercentage(color1: finalGuess.color, color2: answer.color)
                feedbackMessage = "You were \(similarity)% similar!"
            }
            return
        }
        
        // --- 3. Wrong Guess Logic (Shake + Feedback) ---
        triggerHaptic(type: .error) // <--- WARNING/ERROR HAPTIC
        triggerShake(for: guessedTile.id) // <--- TRIGGER ANIMATION
        
        guard let answer = correctAnswer else { return }
        let distance = Color.colorDifference(color1: guessedTile.color, color2: answer.color)
        
        var feedback: String
        if distance < 100 {
            feedback = "You're hot!"
        } else if distance < 250 {
            feedback = "Getting warmer..."
        } else {
            feedback = "Ice cold."
        }
        
        feedbackMessage = "\(feedback) (\(guessesLeft) guesses left)"
    }
    
    /// Triggers the visual shake animation for a specific tile
    private func triggerShake(for tileId: UUID) {
        // We wrap this in withAnimation to drive the transition 0 -> 1 in the View modifier
        withAnimation(.default) {
            self.shakingTileId = tileId
        }
        
        // Reset after animation completes so it can be triggered again
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.shakingTileId = nil
        }
    }
    
    /// Triggers physical haptic feedback on supported devices
    private func triggerHaptic(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
}
