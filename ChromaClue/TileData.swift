//
//  TileData.swift
//  ChromaClue
//
//  Created by Vedant Saxena on 10/28/25.
//

import SwiftUI

/// Contains the master list of 54 colors.
/// Hints have been removed to support the new "Color Math" gameplay.
struct TileData {
    
    static let tiles: [ChromaTile] = [
        
        // MARK: - Row 1: Deep Reds & Maroons
        ChromaTile(color: Color(red: 0.5, green: 0.0, blue: 0.0)),
        ChromaTile(color: Color(red: 0.7, green: 0.1, blue: 0.1)),
        ChromaTile(color: Color(red: 1.0, green: 0.0, blue: 0.0)),
        ChromaTile(color: Color(red: 0.9, green: 0.2, blue: 0.4)),
        ChromaTile(color: Color(red: 1.0, green: 0.4, blue: 0.7)),
        ChromaTile(color: Color(red: 0.6, green: 0.0, blue: 0.2)),

        // MARK: - Row 2: Corals & Pinks
        ChromaTile(color: Color(red: 1.0, green: 0.7, blue: 0.7)),
        ChromaTile(color: Color(red: 1.0, green: 0.6, blue: 0.4)),
        ChromaTile(color: Color(red: 0.9, green: 0.4, blue: 0.4)),
        ChromaTile(color: Color(red: 1.0, green: 0.07, blue: 0.57)),
        ChromaTile(color: Color(red: 0.9, green: 0.9, blue: 0.9)),
        ChromaTile(color: Color(red: 0.98, green: 0.85, blue: 0.87)),

        // MARK: - Row 3: Oranges & Golds
        ChromaTile(color: Color(red: 1.0, green: 0.5, blue: 0.0)),
        ChromaTile(color: Color(red: 0.9, green: 0.3, blue: 0.0)),
        ChromaTile(color: Color(red: 1.0, green: 0.8, blue: 0.0)),
        ChromaTile(color: Color(red: 1.0, green: 1.0, blue: 0.4)),
        ChromaTile(color: Color(red: 0.8, green: 0.6, blue: 0.2)),
        ChromaTile(color: Color(red: 1.0, green: 0.9, blue: 0.7)),

        // MARK: - Row 4: Yellow-Greens & Limes
        ChromaTile(color: Color(red: 0.7, green: 1.0, blue: 0.0)),
        ChromaTile(color: Color(red: 0.5, green: 0.8, blue: 0.0)),
        ChromaTile(color: Color(red: 0.6, green: 0.8, blue: 0.2)),
        ChromaTile(color: Color(red: 0.5, green: 0.5, blue: 0.0)),
        ChromaTile(color: Color(red: 0.8, green: 1.0, blue: 0.6)),
        ChromaTile(color: Color(red: 0.4, green: 0.6, blue: 0.2)),

        // MARK: - Row 5: True Greens & Teals
        ChromaTile(color: Color(red: 0.0, green: 0.5, blue: 0.0)),
        ChromaTile(color: Color(red: 0.2, green: 0.7, blue: 0.2)),
        ChromaTile(color: Color(red: 0.1, green: 0.3, blue: 0.1)),
        ChromaTile(color: Color(red: 0.0, green: 0.6, blue: 0.5)),
        ChromaTile(color: Color(red: 0.0, green: 0.8, blue: 0.8)),
        ChromaTile(color: Color(red: 0.4, green: 1.0, blue: 0.8)),

        // MARK: - Row 6: Blues
        ChromaTile(color: Color(red: 0.0, green: 0.0, blue: 1.0)),
        ChromaTile(color: Color(red: 0.0, green: 0.0, blue: 0.5)),
        ChromaTile(color: Color(red: 0.3, green: 0.7, blue: 1.0)),
        ChromaTile(color: Color(red: 0.4, green: 0.4, blue: 0.7)),
        ChromaTile(color: Color(red: 0.1, green: 0.1, blue: 0.3)),
        ChromaTile(color: Color(red: 0.2, green: 0.4, blue: 0.8)),

        // MARK: - Row 7: Indigos & Violets
        ChromaTile(color: Color(red: 0.3, green: 0.0, blue: 0.5)),
        ChromaTile(color: Color(red: 0.5, green: 0.0, blue: 0.5)),
        ChromaTile(color: Color(red: 0.6, green: 0.4, blue: 0.8)),
        ChromaTile(color: Color(red: 0.8, green: 0.5, blue: 0.8)),
        ChromaTile(color: Color(red: 0.3, green: 0.0, blue: 0.3)),
        ChromaTile(color: Color(red: 0.5, green: 0.0, blue: 1.0)),

        // MARK: - Row 8: Browns & Earth Tones
        ChromaTile(color: Color(red: 0.6, green: 0.4, blue: 0.2)),
        ChromaTile(color: Color(red: 0.4, green: 0.2, blue: 0.0)),
        ChromaTile(color: Color(red: 0.8, green: 0.7, blue: 0.5)),
        ChromaTile(color: Color(red: 0.5, green: 0.3, blue: 0.1)),
        ChromaTile(color: Color(red: 0.9, green: 0.8, blue: 0.6)),
        ChromaTile(color: Color(red: 0.3, green: 0.2, blue: 0.1)),

        // MARK: - Row 9: Greys, Blacks, Whites
        ChromaTile(color: Color(red: 0.1, green: 0.12, blue: 0.15)),
        ChromaTile(color: Color(red: 0.2, green: 0.2, blue: 0.2)),
        ChromaTile(color: Color(red: 0.5, green: 0.5, blue: 0.5)),
        ChromaTile(color: Color(red: 0.7, green: 0.7, blue: 0.7)),
        ChromaTile(color: Color(red: 0.8, green: 0.8, blue: 0.8)),
        ChromaTile(color: Color(red: 0.94, green: 0.92, blue: 0.84))
    ]
}
