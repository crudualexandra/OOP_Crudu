// main.swift

import Foundation


let monitor1 = Display(width: 1920, height: 1080, ppi: 401.0, model: "Monitor A")
let monitor2 = Display(width: 2560, height: 1440, ppi: 300.0, model: "Monitor B")
let monitor3 = Display(width: 3840, height: 2160, ppi: 800.0, model: "Monitor C")


let assistant = Assistant(assistantName: "Sanda")

// Assign displays 
assistant.assignDisplay(monitor1)
assistant.assignDisplay(monitor2)
assistant.assignDisplay(monitor3)

// Assistant assists
assistant.assist()

// Buy a display
if let purchasedDisplay = assistant.buyDisplay(monitor2) {
    print("\nYou have purchased \(purchasedDisplay.getModel()).")
}

// Assistant assists again after one display is sold
assistant.assist()
