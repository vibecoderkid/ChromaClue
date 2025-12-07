//
//  GameViewModel.swift
//  ChromaClue
//
//  Created by Vedant Saxena on 10/28/25.
//

import SwiftUI
import Combine
import UIKit

@MainActor
class GameViewModel: ObservableObject {
    
    // --- Game Data ---
    let allTiles: [ChromaTile] = TileData.tiles
    
    // --- Progression ---
    @Published var currentLevel: Int = 1
    
    enum GameMode {
        case mixing          // User finds the result of A + B
        case deconstruction  // User finds the two ingredients (A, B) that make Target
    }
    
    var activeMode: GameMode {
        return currentLevel <= 10 ? .mixing : .deconstruction
    }

    // --- Round State ---
    @Published var gameState: GameState = .playing
    @Published var guessesLeft: Int = 0
    @Published var feedbackMessage: String = ""
    @Published var lastGuess: ChromaTile?
    
    // --- Streak Logic ---
    @Published var currentStreak: Int = 0
    @Published var bestStreak: Int = UserDefaults.standard.integer(forKey: "ChromaClue_BestStreak")
    
    // --- Visuals & Animation ---
    @Published var shakingTileId: UUID?
    
    // --- MIXING MODE DATA (Levels 1-10) ---
    @Published var mixingIngredients: [Color] = []
    var mixingTargetTile: ChromaTile?
    
    // --- DECONSTRUCTION MODE DATA (Levels 11+) ---
    var deconstructionTargetTiles: Set<UUID> = []
    @Published var deconstructionTargetColor: Color = .clear
    @Published var firstSelection: ChromaTile?
    
    enum GameState {
        case playing, won, lost
    }
    
    // --- Custom Enum to fix the Haptic Type Error ---
    enum HapticType {
        case success
        case warning
        case error
        case selection
    }
    
    let totalGuesses = 3
    
    init() {
        startNewRound()
    }
    
    func startNewRound() {
        if activeMode == .mixing {
            setupMixingRound()
        } else {
            setupDeconstructionRound()
        }
        
        // Reset Common State
        guessesLeft = totalGuesses
        feedbackMessage = "Guesses left: \(guessesLeft)"
        gameState = .playing
        lastGuess = nil
        shakingTileId = nil
        firstSelection = nil
    }
    
    // MARK: - Setup Logic
    
    private func setupMixingRound() {
        let c1 = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
        let c2 = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
        mixingIngredients = [c1, c2]
        
        let result = Color.blend(color1: c1, color2: c2)
        
        mixingTargetTile = allTiles.min(by: { tileA, tileB in
            Color.colorDifference(color1: tileA.color, color2: result) <
            Color.colorDifference(color1: tileB.color, color2: result)
        })
    }
    
    private func setupDeconstructionRound() {
        guard let t1 = allTiles.randomElement(),
              let t2 = allTiles.filter({ $0.id != t1.id }).randomElement() else { return }
        
        deconstructionTargetTiles = [t1.id, t2.id]
        deconstructionTargetColor = Color.blend(color1: t1.color, color2: t2.color)
        firstSelection = nil
    }
    
    // MARK: - Gameplay Logic
    
    func handleTileTap(tile: ChromaTile) {
        if activeMode == .mixing {
            handleMixingGuess(tile)
        } else {
            handleDeconstructionGuess(tile)
        }
    }
    
    private func handleMixingGuess(_ tile: ChromaTile) {
        guard gameState == .playing, let target = mixingTargetTile else { return }
        
        guessesLeft -= 1
        lastGuess = tile
        
        if tile.id == target.id {
            handleWin()
        } else {
            handleWrongGuess(tile: tile, targetColor: target.color)
        }
    }
    
    private func handleDeconstructionGuess(_ tile: ChromaTile) {
        guard gameState == .playing else { return }
        
        // Step 1: User selects first tile
        if firstSelection == nil {
            firstSelection = tile
            triggerHaptic(type: .selection) // This now works with the new enum
            return
        }
        
        // Step 2: User selects second tile
        guard let first = firstSelection else { return }
        
        if first.id == tile.id {
            firstSelection = nil
            return
        }
        
        let guessSet: Set<UUID> = [first.id, tile.id]
        
        guessesLeft -= 1
        lastGuess = tile
        
        if guessSet == deconstructionTargetTiles {
            handleWin()
        } else {
            handleWrongGuess(tile: tile, targetColor: deconstructionTargetColor)
            firstSelection = nil
        }
    }
    
    // MARK: - Common Outcomes
    
    private func handleWin() {
        gameState = .won
        feedbackMessage = "Correct!"
        triggerHaptic(type: .success)
        
        currentStreak += 1
        if currentStreak > bestStreak {
            bestStreak = currentStreak
            UserDefaults.standard.set(bestStreak, forKey: "ChromaClue_BestStreak")
        }
        
        currentLevel += 1
    }
    
    private func handleWrongGuess(tile: ChromaTile, targetColor: Color) {
        if guessesLeft == 0 {
            gameState = .lost
            triggerHaptic(type: .error)
            currentStreak = 0
            
            let similarity = Color.similarityPercentage(color1: tile.color, color2: targetColor)
            feedbackMessage = "Game Over. \(similarity)% close."
        } else {
            triggerHaptic(type: .warning)
            triggerShake(for: tile.id)
            
            let dist = Color.colorDifference(color1: tile.color, color2: targetColor)
            if dist < 100 { feedbackMessage = "Hot!" }
            else if dist < 200 { feedbackMessage = "Warm..." }
            else { feedbackMessage = "Cold." }
            
            feedbackMessage += " (\(guessesLeft) left)"
        }
    }

    // MARK: - Helpers
    
    private func triggerShake(for tileId: UUID) {
        withAnimation(.default) { self.shakingTileId = tileId }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { self.shakingTileId = nil }
    }
    
    /// Triggers physical haptic feedback using the correct generator for the type.
    private func triggerHaptic(type: HapticType) {
        switch type {
        case .success:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        case .warning:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
        case .error:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        case .selection:
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
        }
    }
}
