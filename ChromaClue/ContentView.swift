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
            VStack(spacing: 10) {
                
                // MARK: - Top Bar (Streak & Info)
                HStack {
                    VStack(alignment: .leading) {
                        Text("LEVEL \(viewModel.currentLevel)")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundStyle(.secondary)
                        Text("Streak: \(viewModel.currentStreak)")
                            .font(.system(.subheadline, design: .rounded, weight: .bold))
                            .foregroundStyle(viewModel.currentStreak > 0 ? .orange : .primary)
                    }
                    
                    Spacer()
                    
                    Text("ChromaClue")
                        .font(.system(.headline, design: .rounded, weight: .black))
                        .foregroundStyle(.tertiary)
                    
                    Spacer()
                    
                    Button(action: { showingAboutSheet.toggle() }) {
                        Image(systemName: "info.circle")
                    }
                }
                .padding(.horizontal, 24)
                
                // MARK: - Visual Puzzle Header
                VStack(spacing: 8) {
                    if viewModel.activeMode == .mixing {
                        // Level 1-10: Show A + B = ?
                        Text("MIX THESE TWO")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                        HStack(spacing: 16) {
                            if viewModel.mixingIngredients.count == 2 {
                                ColorSwatch(color: viewModel.mixingIngredients[0])
                                Image(systemName: "plus")
                                ColorSwatch(color: viewModel.mixingIngredients[1])
                                Image(systemName: "equal")
                                QuestionMarkSwatch()
                            }
                        }
                    } else {
                        // Level 11+: Show ? + ? = Result
                        Text("DECONSTRUCT THIS")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                        HStack(spacing: 16) {
                            QuestionMarkSwatch()
                            Image(systemName: "plus")
                            QuestionMarkSwatch()
                            Image(systemName: "equal")
                            ColorSwatch(color: viewModel.deconstructionTargetColor)
                        }
                    }
                }
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground).opacity(0.3))
                
                // MARK: - Grid
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 4) {
                        ForEach(viewModel.allTiles) { tile in
                            Button {
                                viewModel.handleTileTap(tile: tile)
                            } label: {
                                Rectangle()
                                    .fill(tile.color)
                                    .aspectRatio(1, contentMode: .fit)
                                    .cornerRadius(8)
                                    // Shake Animation
                                    .modifier(Shake(animatableData: viewModel.shakingTileId == tile.id ? 1 : 0))
                                    // Highlight if it's the first selection in Deconstruction mode
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.primary, lineWidth: viewModel.firstSelection == tile ? 4 : 0)
                                    )
                            }
                            .disabled(viewModel.gameState != .playing)
                        }
                    }
                    .padding()
                }
                
                // MARK: - Feedback Area
                Text(viewModel.feedbackMessage)
                    .font(.system(.title3, design: .rounded, weight: .medium))
                    .frame(height: 50)
            }
            .navigationViewStyle(.stack)
            .sheet(isPresented: $showingAboutSheet) {
                AboutView()
            }
            
            // MARK: - Overlay
            if viewModel.gameState != .playing {
                GameOverlayView(viewModel: viewModel)
            }
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: viewModel.gameState)
    }
}

// --- Helper Views ---

struct ColorSwatch: View {
    let color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(color)
            .frame(width: 50, height: 50)
            .shadow(radius: 2)
    }
}

struct QuestionMarkSwatch: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.tertiarySystemFill))
                .frame(width: 50, height: 50)
            Text("?")
                .font(.title)
                .bold()
                .foregroundStyle(.secondary)
        }
    }
}

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

struct GameOverlayView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        Color.black.opacity(0.6).ignoresSafeArea()
        
        VStack(spacing: 20) {
            Text(viewModel.gameState == .won ? "Level Complete!" : "Game Over")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .foregroundStyle(.white)
            
            if viewModel.gameState == .won {
                Text("Streak: \(viewModel.currentStreak)")
                    .font(.title2)
                    .foregroundStyle(.orange)
            } else {
                Text("The correct color was:")
                    .foregroundStyle(.white)
                if let target = viewModel.mixingTargetTile {
                    ColorSwatch(color: target.color)
                }
            }
            
            Button("Next Round") {
                viewModel.startNewRound()
            }
            .font(.headline)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .shadow(radius: 20)
        .padding(40)
    }
}

#Preview {
    ContentView()
}
