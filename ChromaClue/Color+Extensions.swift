//
//  Color+Extensions.swift
//  ChromaClue
//
//  Created by Vedant Saxena on 10/28/25.
//

import SwiftUI
import UIKit

extension Color {
    
    /// Gets the Red, Green, Blue, and Alpha components from a SwiftUI Color.
    var rgbComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        let uiColor = UIColor(self)
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return (r, g, b, a)
    }
    
    /// Calculates the Euclidean distance between two colors in RGB space.
    /// Result: 0 (Identical) to ~442 (Max difference).
    static func colorDifference(color1: Color, color2: Color) -> Double {
        let c1 = color1.rgbComponents
        let c2 = color2.rgbComponents
        
        let deltaR = (c2.red - c1.red) * 255
        let deltaG = (c2.green - c1.green) * 255
        let deltaB = (c2.blue - c1.blue) * 255
        
        return sqrt(pow(deltaR, 2) + pow(deltaG, 2) + pow(deltaB, 2))
    }
    
    /// Converts distance to similarity percentage.
    static func similarityPercentage(color1: Color, color2: Color) -> Int {
        let maxDistance = sqrt(pow(255, 2) * 3)
        let distance = colorDifference(color1: color1, color2: color2)
        let similarity = 100.0 - (distance / maxDistance * 100.0)
        return Int(similarity.rounded())
    }
    
    /// Blends two colors evenly (50% mix).
    static func blend(color1: Color, color2: Color) -> Color {
        let c1 = color1.rgbComponents
        let c2 = color2.rgbComponents
        
        return Color(
            red: (c1.red + c2.red) / 2,
            green: (c1.green + c2.green) / 2,
            blue: (c1.blue + c2.blue) / 2,
            opacity: 1.0
        )
    }
}
