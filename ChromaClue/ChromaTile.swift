//
//  ChromaTile.swift
//  ChromaClue
//
//  Created by Vedant Saxena on 10/28/25.
//

import SwiftUI

/// Represents a single tile in our 6x9 grid.
/// Removed 'hints' as the game is now purely visual logic.
struct ChromaTile: Identifiable, Equatable {
    let id = UUID()
    let color: Color
    
    static func == (lhs: ChromaTile, rhs: ChromaTile) -> Bool {
        lhs.id == rhs.id
    }
}
