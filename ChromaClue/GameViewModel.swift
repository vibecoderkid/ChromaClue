//
//  GameViewModel.swift
//  ChromaClue
//
//  Created by Vedant Saxena on 10/28/25.
//

import SwiftUI
import Combine // <-- ADD THIS LINE

/// The "brains" of the game, this class manages all game state and logic.
@MainActor // Ensures all UI updates happen on the main thread
class GameViewModel: ObservableObject {
    
    // --- Game Data ---
    /// The master list of all 36 tiles
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
        // Pick a random tile to be the answer
        correctAnswer = allTiles.randomElement()
        
        // Pick a random hint from that tile's list
        currentHint = correctAnswer?.hints.randomElement() ?? "No hint found"
        
        // Reset game state
        guessesLeft = totalGuesses
        feedbackMessage = "Guesses left: \(guessesLeft)"
        gameState = .playing
        lastGuess = nil
    }
    
    /// Processes a user's guess
    func makeGuess(guessedTile: ChromaTile) {
        // Ignore taps if the game is already over
        guard gameState == .playing else { return }
        
        // Store this guess for the lose screen
        lastGuess = guessedTile
        guessesLeft -= 1
        
        // --- 1. Check for a WIN ---
        if guessedTile == correctAnswer {
            gameState = .won
            feedbackMessage = "You got it!"
            return
        }
        
        // --- 2. Check for a LOSS ---
        if guessesLeft == 0 {
            gameState = .lost
            // Show the similarity percentage on the final feedback
            if let answer = correctAnswer, let finalGuess = lastGuess {
                let similarity = Color.similarityPercentage(color1: finalGuess.color, color2: answer.color)
                feedbackMessage = "You were \(similarity)% similar!"
            }
            return
        }
        
        // --- 3. Give "Hot/Cold" FEEDBACK ---
        guard let answer = correctAnswer else { return }
        
        // Get the "distance" between the colors. Lower is better.
        let distance = Color.colorDifference(color1: guessedTile.color, color2: answer.color)
        
        var feedback: String
        
        // These thresholds (0-442 max) determine the feedback.
        if distance < 100 {
            feedback = "You're hot!"
        } else if distance < 250 {
            feedback = "Getting warmer..."
        } else {
            feedback = "Ice cold."
        }
        
        feedbackMessage = "\(feedback) (\(guessesLeft) guesses left)"
    }
}


