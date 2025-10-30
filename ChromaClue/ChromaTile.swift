//
//  ChromaTile.swift
//  ChromaClue
//
//  Created by Vedant Saxena on 10/28/25.
//


import SwiftUI

/// Represents a single tile in our 6x6 grid.
/// It is Identifiable so the grid can loop over it.
/// It is Equatable so we can check if a guess matches the answer.
struct ChromaTile: Identifiable, Equatable {
    let id = UUID()
    let color: Color
    let hints: [String]
    
    static func == (lhs: ChromaTile, rhs: ChromaTile) -> Bool {
        // We only need to compare the ID, as each tile is unique.
        lhs.id == rhs.id
    }
}
