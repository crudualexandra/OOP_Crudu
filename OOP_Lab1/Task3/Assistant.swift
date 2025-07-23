// Assistant.swift

import Foundation

class Assistant {
    private var assistantName: String
    private var assignedDisplays: [Display] = []

    init(assistantName: String) {
        self.assistantName = assistantName
    }

    func assignDisplay(_ display: Display) {
        assignedDisplays.append(display)
    }

    func assist() {
        guard assignedDisplays.count > 1 else {
            print("Not enough displays to compare.")
            return
        }

        print("\(assistantName) is assisting with display comparisons:")

        for i in 0..<(assignedDisplays.count - 1) {
            let currentDisplay = assignedDisplays[i]
            let nextDisplay = assignedDisplays[i + 1]

            print("\nComparing \(currentDisplay.getModel()) and \(nextDisplay.getModel()):")
            currentDisplay.compareSize(with: nextDisplay)
            currentDisplay.compareSharpness(with: nextDisplay)
            currentDisplay.compareWithMonitor(with: nextDisplay)
        }
    }

    func buyDisplay(_ display: Display) -> Display? {
        if let index = assignedDisplays.firstIndex(where: { $0 === display }) {
            let purchasedDisplay = assignedDisplays.remove(at: index)
            print("\(assistantName) has sold \(purchasedDisplay.getModel()).")
            return purchasedDisplay
        } else {
            print("Display not found in the assigned list.")
            return nil
        }
    }
}
