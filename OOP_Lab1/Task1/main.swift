// main.swift

import Foundation

// Display objects
let monitor1 = Display(width: 1920, height: 1080, ppi: 401.0, model: "Monitor A")
let monitor2 = Display(width: 2560, height: 1440, ppi: 300.0, model: "Monitor B")
let monitor3 = Display(width: 3840, height: 2160, ppi: 800.0, model: "Monitor C")

// Compare Monitor A and  B
print("Comparing \(monitor1.getModel()) and \(monitor2.getModel()):")
monitor1.compareSize(with: monitor2)
monitor1.compareSharpness(with: monitor2)
monitor1.compareWithMonitor(with: monitor2)
print("")

// Compare Monitor A and  C
print("Comparing \(monitor1.getModel()) and \(monitor3.getModel()):")
monitor1.compareSize(with: monitor3)
monitor1.compareSharpness(with: monitor3)
monitor1.compareWithMonitor(with: monitor3)
print("")

// Compare Monitor B and  C
print("Comparing \(monitor2.getModel()) and \(monitor3.getModel()):")
monitor2.compareSize(with: monitor3)
monitor2.compareSharpness(with: monitor3)
monitor2.compareWithMonitor(with: monitor3)
print("")
