//
//  ContentView.swift
//  ChromaClue
//
//  Created by Vedant Saxena on 10/27/25.
//

import SwiftUI

struct ContentView: View {
    
    /// The "brains" of the game. We create one instance and observe it.
    @StateObject private var viewModel = GameViewModel()
    
    /// Defines the 6-column layout for the grid.
    /// The number of rows is determined by the data count (54 tiles / 6 cols = 9 rows).
    private let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 8), count: 6)
    
    var body: some View {
        ZStack {
            // Main game UI
            VStack(spacing: 0) { // Spacing handled by padding inside elements
                
                // MARK: - Hint Area (Fixed at Top)
                VStack {
                    Text("HINT")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .padding(.top, 16)
                    
                    // The hint itself
                    Text(viewModel.currentHint)
                        .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.center)
                        .animation(.none, value: viewModel.currentHint) // Don't animate hint text changes
                        .padding(.bottom, 16)
                }
                .frame(minHeight: 100)
                .background(Color(.systemBackground)) // Ensure it has a background if it floats
                
                // MARK: - Scrollable Grid Area
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(viewModel.allTiles) { tile in
                            Button {
                                // Tapping a tile triggers the guess logic
                                viewModel.makeGuess(guessedTile: tile)
                            } label: {
                                Rectangle()
                                    .fill(tile.color)
                                    .aspectRatio(1, contentMode: .fit) // Makes it a perfect square
                                    .cornerRadius(8)
                            }
                            // Disable buttons when game is not being played
                            .disabled(viewModel.gameState != .playing)
                        }
                    }
                    .padding() // Padding around the grid content
                    .padding(.bottom, 20) // Extra padding at bottom so last row isn't cramped
                }
                
                // MARK: - Feedback Area (Fixed at Bottom)
                // Kept outside the ScrollView so the user always sees their result immediately
                VStack {
                    Text(viewModel.feedbackMessage)
                        .font(.system(.title2, design: .rounded, weight: .medium))
                        .multilineTextAlignment(.center)
                }
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground)) // Opaque background
            }
            
            // MARK: - Win/Loss Overlay
            // This view appears over the top when the game is won or lost
            if viewModel.gameState != .playing {
                GameOverlayView(viewModel: viewModel)
            }
        }
        // Use a subtle animation for the overlay appearing/disappearing
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: viewModel.gameState)
    }
}

/// The modal-like view that appears when the game is won or lost.
struct GameOverlayView: View {
    
    /// We use @ObservedObject here because the view is *not* creating
    /// the viewModel, just watching the one passed in from ContentView.
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        // A semi-transparent background to dim the game
        Color.black.opacity(0.6)
            .ignoresSafeArea()
        
        // The modal content
        VStack(spacing: 20) {
            
            // --- Title ---
            Text(viewModel.gameState == .won ? "You Won!" : "Game Over!")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
            
            // --- Correct Answer ---
            VStack {
                Text("The color for \"\(viewModel.currentHint)\" was:")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                if let correctColor = viewModel.correctAnswer?.color {
                    Rectangle()
                        .fill(correctColor)
                        .frame(width: 100, height: 100)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
            }
            
            // --- Show final guess ONLY if the user lost ---
            if viewModel.gameState == .lost {
                VStack {
                    Text("Your final guess:")
                        .font(.headline)
                    
                    if let lastGuessColor = viewModel.lastGuess?.color {
                        Rectangle()
                            .fill(lastGuessColor)
                            .frame(width: 80, height: 80)
                            .cornerRadius(12)
                    }
                    
                    // The final feedback (e.g., "You were 85% similar!")
                    Text(viewModel.feedbackMessage)
                        .font(.system(.title3, design: .rounded, weight: .medium))
                        .padding(.top, 4)
                }
            }
            
            // --- Play Again Button ---
            Button {
                viewModel.startNewRound()
            } label: {
                Text("Play Again")
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 14)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
            .padding(.top)
            
        }
        .padding(30)
        .background(Color(.systemBackground)) // Adapts to light/dark mode
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(30) // Adds margin around the modal
    }
}

#Preview {
    ContentView()
}
