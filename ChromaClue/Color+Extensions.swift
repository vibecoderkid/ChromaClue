//
//  Color+Extensions.swift
//  ChromaClue
//
//  Created by Vedant Saxena on 10/28/25.
//

import SwiftUI
import UIKit // We need UIKit to access the .getRed() method

/// This helper extension calculates the "distance" between two colors.
extension Color {
    
    /// Gets the Red, Green, Blue, and Alpha components from a SwiftUI Color.
    var rgbComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        // Convert SwiftUI Color to UIKit UIColor
        let uiColor = UIColor(self)
        
        // Get components
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return (r, g, b, a)
    }
    
    /// Calculates the "Euclidean distance" between two colors in the RGB space.
    /// The result is a number between 0 (identical) and ~441.67 (max difference, e.g., black to white).
    static func colorDifference(color1: Color, color2: Color) -> Double {
        let c1 = color1.rgbComponents
        let c2 = color2.rgbComponents
        
        // Calculate deltas, scaling from 0.0-1.0 to 0-255
        let deltaR = (c2.red - c1.red) * 255
        let deltaG = (c2.green - c1.green) * 255
        let deltaB = (c2.blue - c1.blue) * 255
        
        // The Pythagorean theorem in 3D space
        let distance = sqrt(pow(deltaR, 2) + pow(deltaG, 2) + pow(deltaB, 2))
        return distance
    }
    
    /// Converts the raw "distance" (0-442) into an intuitive similarity percentage (0-100%).
    static func similarityPercentage(color1: Color, color2: Color) -> Int {
        // The theoretical maximum distance in 3D RGB space (255, 255, 255)
        let maxDistance = sqrt(pow(255, 2) * 3)
        
        let distance = colorDifference(color1: color1, color2: color2)
        
        // Invert the distance to get similarity
        let similarity = 100.0 - (distance / maxDistance * 100.0)
        
        // Return a clean integer
        return Int(similarity.rounded())
    }
}
