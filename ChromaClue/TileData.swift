//
//  TileData.swift
//  ChromaClue
//
//  Created by Vedant Saxena on 10/28/25.
//


import SwiftUI

/// Contains the master list of all 36 colors and their hints.
struct TileData {
    
    static let tiles: [ChromaTile] = [
        // MARK: - Row 1: Reds / Pinks
        ChromaTile(color: Color(red: 0.7, green: 0.1, blue: 0.1), hints: ["Rose", "Cherry", "Ruby", "Stop Sign", "Love"]),
        ChromaTile(color: Color(red: 1.0, green: 0.0, blue: 0.0), hints: ["Fire Truck", "Apple", "Warning", "Target", "Poppy"]),
        ChromaTile(color: Color(red: 0.9, green: 0.2, blue: 0.4), hints: ["Raspberry", "Watermelon", "Lipstick", "Blush", "Cosmos"]),
        ChromaTile(color: Color(red: 1.0, green: 0.4, blue: 0.7), hints: ["Pink", "Flamingo", "Bubblegum", "Carnation", "Cotton Candy"]),
        ChromaTile(color: Color(red: 0.6, green: 0.0, blue: 0.2), hints: ["Maroon", "Wine", "Garnet", "Velvet", "Currant"]),
        ChromaTile(color: Color(red: 1.0, green: 0.7, blue: 0.7), hints: ["Salmon", "Peach", "Coral", "Light Pink", "Rosy"]),

        // MARK: - Row 2: Oranges / Yellows
        ChromaTile(color: Color(red: 1.0, green: 0.5, blue: 0.0), hints: ["Orange", "Carrot", "Basketball", "Tiger", "Sunset"]),
        ChromaTile(color: Color(red: 0.9, green: 0.3, blue: 0.0), hints: ["Rust", "Autumn", "Clay", "Terracotta", "Brick"]),
        ChromaTile(color: Color(red: 1.0, green: 0.8, blue: 0.0), hints: ["Yellow", "Sun", "Lemon", "Gold", "Bee"]),
        ChromaTile(color: Color(red: 1.0, green: 1.0, blue: 0.4), hints: ["Canary", "Daffodil", "Butter", "Blonde", "Light Yellow"]),
        ChromaTile(color: Color(red: 0.8, green: 0.6, blue: 0.2), hints: ["Mustard", "Goldfish", "Honey", "Amber", "Dijon"]),
        ChromaTile(color: Color(red: 1.0, green: 0.9, blue: 0.7), hints: ["Cream", "Beige", "Ivory", "Vanilla", "Eggshell"]),

        // MARK: - Row 3: Greens
        ChromaTile(color: Color(red: 0.0, green: 0.5, blue: 0.0), hints: ["Green", "Grass", "Clover", "Forest", "Emerald"]),
        ChromaTile(color: Color(red: 0.5, green: 0.8, blue: 0.0), hints: ["Lime", "Tennis Ball", "Chartreuse", "Peridot", "Acid"]),
        ChromaTile(color: Color(red: 0.2, green: 0.7, blue: 0.2), hints: ["Kelly Green", "Leaf", "Ireland", "Go", "Jolly Roger"]),
        ChromaTile(color: Color(red: 0.1, green: 0.3, blue: 0.1), hints: ["Dark Green", "Pine", "Seaweed", "Billiards", "Dollar"]),
        ChromaTile(color: Color(red: 0.5, green: 1.0, blue: 0.5), hints: ["Mint", "Light Green", "Pistachio", "Spring", "Pastel"]),
        ChromaTile(color: Color(red: 0.3, green: 0.5, blue: 0.3), hints: ["Olive", "Moss", "Army", "Drab", "Khaki"]),

        // MARK: - Row 4: Blues
        ChromaTile(color: Color(red: 0.0, green: 0.0, blue: 1.0), hints: ["Blue", "Ocean", "Sky", "Sapphire", "Royal"]),
        ChromaTile(color: Color(red: 0.0, green: 0.0, blue: 0.5), hints: ["Navy", "Midnight", "Denim", "Deep Blue", "Ink"]),
        ChromaTile(color: Color(red: 0.3, green: 0.7, blue: 1.0), hints: ["Light Blue", "Baby Blue", "Sky", "Robin's Egg", "Frost"]),
        ChromaTile(color: Color(red: 0.0, green: 0.7, blue: 0.7), hints: ["Teal", "Turquoise", "Cyan", "Peacock", "Tide"]),
        ChromaTile(color: Color(red: 0.4, green: 0.4, blue: 0.7), hints: ["Periwinkle", "Bluebell", "Wisteria", "Twilight", "Faded Blue"]),
        ChromaTile(color: Color(red: 0.1, green: 0.1, blue: 0.3), hints: ["Indigo", "Void", "Deep Space", "Bruise", "Night"]),

        // MARK: - Row 5: Purples / Magentas
        ChromaTile(color: Color(red: 0.5, green: 0.0, blue: 0.5), hints: ["Purple", "Grape", "Violet", "Amethyst", "Royalty"]),
        ChromaTile(color: Color(red: 0.8, green: 0.5, blue: 0.8), hints: ["Lavender", "Lilac", "Thistle", "Light Purple", "Orchid"]),
        ChromaTile(color: Color(red: 1.0, green: 0.0, blue: 1.0), hints: ["Magenta", "Fuchsia", "Hot Pink", "Bright", "Neon"]),
        ChromaTile(color: Color(red: 0.3, green: 0.0, blue: 0.3), hints: ["Plum", "Eggplant", "Fig", "Dark Purple", "Prune"]),
        ChromaTile(color: Color(red: 0.6, green: 0.3, blue: 0.6), hints: ["Mauve", "Heather", "Orchid", "Muted Purple", "Dusty"]),
        ChromaTile(color: Color(red: 0.8, green: 0.0, blue: 0.4), hints: ["Cerise", "Hot Pink", "Razzle Dazzle Rose", "Shocking", "Crayola"]),
        
        // MARK: - Row 6: Browns / Greys
        ChromaTile(color: Color(red: 0.6, green: 0.4, blue: 0.2), hints: ["Brown", "Wood", "Chocolate", "Coffee", "Earth"]),
        ChromaTile(color: Color(red: 0.4, green: 0.2, blue: 0.0), hints: ["Dark Brown", "Espresso", "Bark", "Walnut", "Soil"]),
        ChromaTile(color: Color(red: 0.5, green: 0.5, blue: 0.5), hints: ["Grey", "Gray", "Cloud", "Stone", "Elephant"]),
        ChromaTile(color: Color(red: 0.2, green: 0.2, blue: 0.2), hints: ["Charcoal", "Dark Grey", "Asphalt", "Lead", "Graphite"]),
        ChromaTile(color: Color(red: 0.8, green: 0.8, blue: 0.8), hints: ["Light Grey", "Silver", "Ash", "Coin", "Pebble"]),
        ChromaTile(color: Color(red: 1.0, green: 1.0, blue: 1.0), hints: ["White", "Snow", "Cloud", "Paper", "Milk"])
    ]
}
