//
//  ContentView.swift
//  ChromaClue
//
//  Created by Vedant Saxena on 10/27/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAboutSheet = false
    @StateObject private var viewModel = GameViewModel()
    
    private let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 8), count: 6)
    
    var body: some View {
        ZStack {
            // Main game UI
            VStack(spacing: 0) {
                
                // MARK: - Streak Header
                HStack {
                    VStack(alignment: .leading) {
                        Text("STREAK")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundStyle(.secondary)
                        Text("\(viewModel.currentStreak)")
                            .font(.system(.title2, design: .rounded, weight: .heavy))
                            .foregroundStyle(viewModel.currentStreak > 0 ? .orange : .primary)
                    }
                    
                    Spacer()
                    
//                    Text("ChromaClue")
//                        .font(.system(.headline, design: .rounded, weight: .black))
//                        .foregroundStyle(.tertiary)
//                    
//                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("BEST")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundStyle(.secondary)
                        Text("\(viewModel.bestStreak)")
                            .font(.system(.title2, design: .rounded, weight: .heavy))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 0)
                .padding(.bottom, 0)
                
                // MARK: - Hint Area
                VStack {
                    Text("HINT")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    Text(viewModel.currentHint)
                        .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.center)
                        .animation(.none, value: viewModel.currentHint)
                        .padding(.bottom, 0)
                }
                .frame(minHeight: 0)
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground))
                
                // MARK: - Scrollable Grid Area
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 4) {
                        ForEach(viewModel.allTiles) { tile in
                            Button {
                                viewModel.makeGuess(guessedTile: tile)
                            } label: {
                                Rectangle()
                                    .fill(tile.color)
                                    .aspectRatio(1, contentMode: .fit)
                                    .cornerRadius(8)
                                    // MARK: - Apply Shake Animation
                                    // If this tile is the one shaking, set value to 1, else 0.
                                    // The Shake struct handles the interpolation.
                                    .modifier(Shake(animatableData: viewModel.shakingTileId == tile.id ? 1 : 0))
                            }
                            .disabled(viewModel.gameState != .playing)
                        }
                    }
                    .padding()
                    .padding(.bottom, 20)
                }
                
                // MARK: - Feedback Area
                VStack {
                    Text(viewModel.feedbackMessage)
                        .font(.system(.title2, design: .rounded, weight: .medium))
                        .multilineTextAlignment(.center)
                }
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground))
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        showingAboutSheet.toggle()
                    }) {
                        Image(systemName: "info.circle")
                    }
                }
            }
            .navigationViewStyle(.stack)
            .sheet(isPresented: $showingAboutSheet) {
                AboutView()
            }

            
            // MARK: - Win/Loss Overlay
            if viewModel.gameState != .playing {
                GameOverlayView(viewModel: viewModel)
            }
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: viewModel.gameState)
    }
}

/// A custom GeometryEffect that creates a shake animation.
/// When animatableData interpolates from 0 -> 1, the sine wave creates a back-and-forth motion.
struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit: CGFloat = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * shakesPerUnit),
            y: 0))
    }
}

/// The modal-like view that appears when the game is won or lost.
struct GameOverlayView: View {
    
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        Color.black.opacity(0.6)
            .ignoresSafeArea()
        
        VStack(spacing: 20) {
            
            Text(viewModel.gameState == .won ? "You Won!" : "Game Over!")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
            
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
            
            if viewModel.gameState == .won {
                Text("Streak: \(viewModel.currentStreak) 🔥")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.orange)
            } else {
                 Text("Streak Reset 😢")
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            
            if viewModel.gameState == .lost {
                VStack {
                    Text("Your final guess:")
                        .font(.headline)
                        .padding(.top, 8)
                    
                    if let lastGuessColor = viewModel.lastGuess?.color {
                        Rectangle()
                            .fill(lastGuessColor)
                            .frame(width: 80, height: 80)
                            .cornerRadius(12)
                    }
                    
                    Text(viewModel.feedbackMessage)
                        .font(.system(.title3, design: .rounded, weight: .medium))
                        .padding(.top, 4)
                }
            }
            
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
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(30)
    }
}

#Preview {
    ContentView()
}
