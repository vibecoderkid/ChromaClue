# 🎨 ChromaClue

### The Color Logic Puzzle for iOS

**ChromaClue** isn't just a guessing game—it's **Calculus for your Eyes**.

Forget word hints. We've turned color theory into a math problem. Can you predict the result of two mixed colors? Can you look at a shade of teal and reverse-engineer the exact two tiles that created it?

Dive into the spectrum and test your visual intuition.

---

## 🎮 How It Works

ChromaClue evolves as you play, shifting from "Predictive" logic to "Deconstructive" logic.

### 🧪 Levels 1–10: The Alchemist (Mixing Mode)
You are the apprentice. We give you the ingredients; you predict the potion.
* **The Equation:** `[Color A] + [Color B] = ?`
* **The Goal:** Tap the single tile on the grid that matches the result of mixing A and B.

### 🧠 Levels 11+: The Master (Deconstruction Mode)
The training wheels are off. Now you must think backward.
* **The Equation:** `? + ? = [Target Color]`
* **The Goal:** Find the **two** specific tiles on the grid that, when blended, create the target color.
* **Difficulty:** Infinite. The game continues as long as your streak survives.

---

## ✨ Features

* **Dynamic 6x9 Grid:** A beautifully rendered palette of 54 distinct shades, from "Cosmic Void" black to "Cream" white.
* **Smart Haptics:** Feel the game. Satisfying clicks for correct answers, warning vibrations for "Warm" guesses, and error feedback for misses.
* **Visual Math Engine:** Built on a custom color-distance algorithm that calculates Euclidean distance in RGB space to determine exactly how "Hot" or "Cold" your guess is.
* **Streak System:** Builds tension by tracking your consecutive wins. Your **Best Streak** is saved forever—can you beat your high score?
* **Adaptive UI:** The interface shifts equations and input methods seamlessly as you graduate from Mixing to Deconstruction.

---

## 🛠️ Under the Hood

ChromaClue is built with modern iOS standards, focusing on clean architecture and fluid animations.

* **Language:** Swift 5.0
* **Framework:** SwiftUI (MVVM Architecture)
* **Input:** `Combine` for reactive state management.
* **Feedback:** `UIKit` integration for `UINotificationFeedbackGenerator` (Haptics).
* **Math:** Custom `Color+Extensions` for RGB component extraction and 3D color space distance calculation.

```swift
// A sneak peek at the mixing logic
static func blend(color1: Color, color2: Color) -> Color {
    let c1 = color1.rgbComponents
    let c2 = color2.rgbComponents
    return Color(
        red: (c1.red + c2.red) / 2,
        green: (c1.green + c2.green) / 2,
        blue: (c1.blue + c2.blue) / 2
    )
}
```

---

## 🚀 Getting Started

1. **Clone the repo**:

  ```
  git clone [https://github.com/vibecoderkid/ChromaClue.git](https://github.com/vibecoderkid/ChromaClue.git)
  ```

2. **Open in Xcode**: Navigate to the folder and open ChromaClue.xcodeproj.

3. **Run**: Select an iOS Simulator (iPhone 15 or later recommended for best color accuracy) and hit Run (Cmd+R).

---

## 📄 License

Distributed under the MIT License. See LICENSE for more information.

<p align="center">
Built with ❤️ and ☕️ by Vibe Coder
</p>

---
