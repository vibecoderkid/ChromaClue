//
//  TileData.swift
//  ChromaClue
//
//  Created by Vedant Saxena on 10/28/25.
//

import SwiftUI

/// Contains the master list of 54 colors and their hints.
/// Expanded to a 6x9 grid layout.
struct TileData {
    
    static let tiles: [ChromaTile] = [
        
        // MARK: - Row 1: Deep Reds & Maroons
        ChromaTile(color: Color(red: 0.5, green: 0.0, blue: 0.0), hints: ["Maroon", "Blood", "Brick", "Burgundy", "Merlot", "Dark Cherry", "Mahogany", "Oxblood", "Crimson", "Wine Cellar"]),
        ChromaTile(color: Color(red: 0.7, green: 0.1, blue: 0.1), hints: ["Rose", "Cherry", "Ruby", "Stop Sign", "Love", "Valentine", "Lipstick", "Cranberry", "Cardinal", "Red Velvet"]),
        ChromaTile(color: Color(red: 1.0, green: 0.0, blue: 0.0), hints: ["Fire Truck", "Apple", "Warning", "Target", "Poppy", "Red Pepper", "Strawberry", "Siren", "Hearts", "Mars"]),
        ChromaTile(color: Color(red: 0.9, green: 0.2, blue: 0.4), hints: ["Raspberry", "Watermelon", "Lipstick", "Blush", "Cosmos", "Sorbet", "Dragonfruit", "Punch", "Radish", "Berry"]),
        ChromaTile(color: Color(red: 1.0, green: 0.4, blue: 0.7), hints: ["Ballet Slipper", "Flamingo", "Bubblegum", "Carnation", "Cotton Candy", "Piglet", "Cupcake", "Taffy", "Princess", "Eraser"]),
        ChromaTile(color: Color(red: 0.6, green: 0.0, blue: 0.2), hints: ["Old Brick", "Wine", "Garnet", "Velvet", "Currant", "Bordeaux", "Jam", "Plum", "Beetroot", "Mulberry"]),

        // MARK: - Row 2: Corals & Pinks
        ChromaTile(color: Color(red: 1.0, green: 0.7, blue: 0.7), hints: ["Salmon", "Peach", "Coral", "Guava", "Rosy", "Grapefruit", "Shrimp", "Ham", "Lox", "Flamingo Feather"]),
        ChromaTile(color: Color(red: 1.0, green: 0.6, blue: 0.4), hints: ["Cantaloupe", "Apricot", "Melon", "Papaya", "Sherbet", "Creamsicle", "Sunset Cloud", "Nectarine", "Coral Reef", "Flesh Tone"]),
        ChromaTile(color: Color(red: 0.9, green: 0.4, blue: 0.4), hints: ["Terracotta", "Clay Pot", "Rusty Nail", "Mars Dust", "Adobe", "Pottery", "Canyon", "Brick Wall", "Dried Blood", "Sienna"]),
        ChromaTile(color: Color(red: 1.0, green: 0.07, blue: 0.57), hints: ["Hot Pink", "Fuschia", "Magenta", "Dragon Fruit", "Neon Pink", "Barbie Car", "Highlighter", "Disco", "Plastic", "Vibrant"]),
        ChromaTile(color: Color(red: 0.9, green: 0.9, blue: 0.9), hints: ["White Smoke", "Vapor", "Near White", "Fog", "Haze", "Steam", "Breath", "Cloudy", "Dirty Snow", "Pearl"]),
        ChromaTile(color: Color(red: 0.98, green: 0.85, blue: 0.87), hints: ["Misty Rose", "Pale Pink", "Baby Girl", "Shell", "Pearl", "Lingerie", "Soap", "Rose Quartz", "Sakura", "Blossom"]),

        // MARK: - Row 3: Oranges & Golds
        ChromaTile(color: Color(red: 1.0, green: 0.5, blue: 0.0), hints: ["Traffic Cone", "Carrot", "Basketball", "Tiger", "Sunset", "Pumpkin", "Halloween", "Orange Juice", "Monarch Butterfly", "Nemo"]),
        ChromaTile(color: Color(red: 0.9, green: 0.3, blue: 0.0), hints: ["Rust", "Autumn", "Clay", "Terracotta", "Brick", "Fox", "Fall Leaf", "Copper", "Bronze", "Cinnamon"]),
        ChromaTile(color: Color(red: 1.0, green: 0.8, blue: 0.0), hints: ["School Bus", "Sun", "Lemon", "Gold", "Bee", "Dandelion", "Cheese", "Banana", "Taxi", "Yolk"]),
        ChromaTile(color: Color(red: 1.0, green: 1.0, blue: 0.4), hints: ["Canary", "Daffodil", "Butter", "Blonde", "Post-it Note", "Popcorn", "Custard", "Chick", "Pineapple", "Sunshine"]),
        ChromaTile(color: Color(red: 0.8, green: 0.6, blue: 0.2), hints: ["Goldenrod", "Goldfish", "Honey", "Amber", "Dijon", "Mustard", "Topaz", "Beer", "Wheat", "Brass"]),
        ChromaTile(color: Color(red: 1.0, green: 0.9, blue: 0.7), hints: ["Alabaster", "Sand", "Ivory", "Vanilla", "Eggshell", "Cream", "Bone", "Parchment", "Beige", "Champagne"]),

        // MARK: - Row 4: Yellow-Greens & Limes
        ChromaTile(color: Color(red: 0.7, green: 1.0, blue: 0.0), hints: ["Chartreuse", "Highlighter Yellow", "Radioactive", "Toxic", "Slime", "Tennis Ball", "Biohazard", "Neon Green", "Glow Stick", "Alien Blood"]),
        ChromaTile(color: Color(red: 0.5, green: 0.8, blue: 0.0), hints: ["Lime", "Zest", "Margarita", "Peridot", "Acid", "Sprite", "Granny Smith", "Caterpillar", "Leaf Bug", "Sour"]),
        ChromaTile(color: Color(red: 0.6, green: 0.8, blue: 0.2), hints: ["Pear", "Avocado Interior", "Pistachio", "Wasabi", "Guacamole", "Green Tea", "Matcha", "Bud", "Sprout", "Sage"]),
        ChromaTile(color: Color(red: 0.5, green: 0.5, blue: 0.0), hints: ["Olive Oil", "Puke", "Swamp", "Murky", "Camo", "Muddy Green", "Pickle", "Relish", "Martini", "Army Fatigues"]),
        ChromaTile(color: Color(red: 0.8, green: 1.0, blue: 0.6), hints: ["Celery", "Pale Green", "Mint Ice Cream", "Cucumber", "Honeydew", "Hospital Walls", "Seafoam", "Pastel Green", "Chalk", "Aloe"]),
        ChromaTile(color: Color(red: 0.4, green: 0.6, blue: 0.2), hints: ["Fern", "Forest Floor", "Mossy", "Jungle", "Turtle", "Reptile", "Crocodile", "Snap Bean", "Pea", "Asparagus"]),

        // MARK: - Row 5: True Greens & Teals
        ChromaTile(color: Color(red: 0.0, green: 0.5, blue: 0.0), hints: ["Money", "Grass", "Clover", "Forest", "Emerald", "Green Pepper", "Kale", "Spinach", "Christmas Tree", "Golf Course"]),
        ChromaTile(color: Color(red: 0.2, green: 0.7, blue: 0.2), hints: ["Kelly Green", "Leaf", "Ireland", "Go", "Jolly Roger", "Leprechaun", "Shamrock", "St. Patrick's", "Turf", "Recycle"]),
        ChromaTile(color: Color(red: 0.1, green: 0.3, blue: 0.1), hints: ["Spruce", "Pine", "Seaweed", "Billiards", "Dollar Bill", "Hunter Green", "Evergreen", "Deep Woods", "Night Vision", "Gator"]),
        ChromaTile(color: Color(red: 0.0, green: 0.6, blue: 0.5), hints: ["Teal", "Mallard Duck", "Persian Green", "Jade", "Tropical Ocean", "Peacock", "Dragonfly", "Lagoon", "Emerald City", "Mermaid"]),
        ChromaTile(color: Color(red: 0.0, green: 0.8, blue: 0.8), hints: ["Cyan", "Aqua", "Turquoise", "Electric Blue", "Pool Water", "Printer Ink", "Scuba", "Clear Water", "Iceberg", "Cool Mint"]),
        ChromaTile(color: Color(red: 0.4, green: 1.0, blue: 0.8), hints: ["Aquamarine", "Toothpaste", "Tiffany", "Minty", "Spring Water", "Glacier", "Ice", "Breeze", "Glass", "Crystal"]),

        // MARK: - Row 6: Blues
        ChromaTile(color: Color(red: 0.0, green: 0.0, blue: 1.0), hints: ["Tardis", "Ocean", "Sky", "Sapphire", "Royal", "Blue Screen of Death", "Cookie Monster", "Sonic", "IKEA", "Flag"]),
        ChromaTile(color: Color(red: 0.0, green: 0.0, blue: 0.5), hints: ["Deep Sea", "Midnight", "Denim", "Police Uniform", "Ink", "Navy", "Marianas Trench", "Night Sky", "Blueberry", "Captain"]),
        ChromaTile(color: Color(red: 0.3, green: 0.7, blue: 1.0), hints: ["Icy", "Twitter Logo", "Sky", "Robin's Egg", "Frost", "Baby Boy", "Cotton", "Daytime", "Cloudless", "Air"]),
        ChromaTile(color: Color(red: 0.4, green: 0.4, blue: 0.7), hints: ["Periwinkle", "Bluebell", "Wisteria", "Twilight", "Faded Blue", "Hydrangea", "Morning Glory", "Cornflower", "Periwinkle", "Blurple"]),
        ChromaTile(color: Color(red: 0.1, green: 0.1, blue: 0.3), hints: ["Galaxy", "Void", "Deep Space", "Bruise", "Night", "Cosmic", "Abyss", "Eclipse", "Blacklight", "Obsidian"]),
        ChromaTile(color: Color(red: 0.2, green: 0.4, blue: 0.8), hints: ["Cobalt", "Dodger Blue", "Facebook", "Hyperlink", "Sporty", "Jersey", "Plastic Cap", "Electric", "Vivid Blue", "Tech"]),

        // MARK: - Row 7: Indigos & Violets
        ChromaTile(color: Color(red: 0.3, green: 0.0, blue: 0.5), hints: ["Indigo", "Grape Juice", "Deep Purple", "Plum Skin", "Imperial", "Velvet Robe", "Wizard", "Nightshade", "Ink Pot", "Concord"]),
        ChromaTile(color: Color(red: 0.5, green: 0.0, blue: 0.5), hints: ["Prince", "Grape", "Violet", "Amethyst", "Royalty", "Barney", "Jelly", "Jam", "Magic", "Potion"]),
        ChromaTile(color: Color(red: 0.6, green: 0.4, blue: 0.8), hints: ["Lavender", "Lilac", "Provencal", "Soap", "Essential Oil", "Easter", "Spring Flower", "Pale Purple", "Haze", "Meditate"]),
        ChromaTile(color: Color(red: 0.8, green: 0.5, blue: 0.8), hints: ["Crocus", "Thistle", "Bouquet", "Orchid", "Fairy", "Pixie Dust", "Mauve", "Heather", "Soft Purple", "Sweet"]),
        ChromaTile(color: Color(red: 0.3, green: 0.0, blue: 0.3), hints: ["Damson", "Eggplant", "Fig", "Raisin", "Prune", "Blackberry", "Currant", "Dark Magic", "Shadow", "Goth"]),
        ChromaTile(color: Color(red: 0.5, green: 0.0, blue: 1.0), hints: ["Electric Purple", "Ultraviolet", "Blacklight", "Laser Tag", "Arcade", "Cyber", "Vivid Violet", "Neon Purple", "Disco Light", "Techno"]),

        // MARK: - Row 8: Browns & Earth Tones
        ChromaTile(color: Color(red: 0.6, green: 0.4, blue: 0.2), hints: ["UPS Truck", "Wood", "Chocolate", "Coffee", "Earth", "Mud", "Bronze", "Bear", "Desk", "Loafers"]),
        ChromaTile(color: Color(red: 0.4, green: 0.2, blue: 0.0), hints: ["Hershey's", "Espresso", "Bark", "Walnut", "Soil", "Dark Chocolate", "Root Beer", "Mahogany", "Leather", "Boot"]),
        ChromaTile(color: Color(red: 0.8, green: 0.7, blue: 0.5), hints: ["Tan", "Khaki", "Sand Dune", "Cardboard", "Latte", "Cappuccino", "Bagel", "Toast", "Biscuit", "Fawn"]),
        ChromaTile(color: Color(red: 0.5, green: 0.3, blue: 0.1), hints: ["Chestnut", "Acorn", "Saddle", "Brownie", "Copper", "Rust", "Penny", "Fox Fur", "Violin", "Pretzel"]),
        ChromaTile(color: Color(red: 0.9, green: 0.8, blue: 0.6), hints: ["Wheat", "Dough", "Cookie", "Oatmeal", "Sandwich", "Crust", "Mushroom", "Raw Wood", "Pine", "Sawdust"]),
        ChromaTile(color: Color(red: 0.3, green: 0.2, blue: 0.1), hints: ["Dark Roast", "Mud Pie", "Peat", "Compost", "Umber", "Sepia", "Old Photo", "Cocoa Bean", "Burnt", "Deep Earth"]),

        // MARK: - Row 9: Greys, Blacks, Whites
        ChromaTile(color: Color(red: 0.0, green: 0.0, blue: 0.0), hints: ["Black", "Void", "Night", "Space", "Coal", "Obsidian", "Raven", "Vader", "Ninja", "Shadow"]),
        ChromaTile(color: Color(red: 0.2, green: 0.2, blue: 0.2), hints: ["Charcoal", "Pavement", "Asphalt", "Lead", "Graphite", "Tire", "Gunmetal", "Dark Grey", "Storm Cloud", "Road"]),
        ChromaTile(color: Color(red: 0.5, green: 0.5, blue: 0.5), hints: ["Tin Can", "Wolf", "Cloud", "Stone", "Elephant", "Grey", "Concrete", "Battleship", "Steel", "Anchor"]),
        ChromaTile(color: Color(red: 0.7, green: 0.7, blue: 0.7), hints: ["Silver", "Chrome", "Mirror", "Aluminum", "Foil", "Grey Hair", "Old", "Quarter", "Dime", "Robot"]),
        ChromaTile(color: Color(red: 0.8, green: 0.8, blue: 0.8), hints: ["Nickel", "Ash", "Coin", "Pebble", "Mist", "Light Grey", "Foggy", "Platinum", "Mouse", "Dust"]),
        ChromaTile(color: Color(red: 0.94, green: 0.92, blue: 0.84), hints: ["Cream", "Linen", "Canvas", "Oat Milk", "Parchment", "Rice", "Tofu", "Ivory", "Antique", "Wool"])
    ]
}
