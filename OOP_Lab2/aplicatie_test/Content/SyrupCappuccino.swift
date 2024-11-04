// SyrupCappuccino.swift

import Foundation

class SyrupCappuccino: Cappuccino {
    override var name: String {
        return "Syrup Cappuccino"
    }
    var syrup: SyrupType

    init(coffeeIntensity: Intensity, mlOfMilk: Int, syrup: SyrupType) {
        self.syrup = syrup
        super.init(coffeeIntensity: coffeeIntensity, mlOfMilk: mlOfMilk)
    }

    override func printDetails() -> String {
        return "\(super.printDetails())\n\(name) syrup: \(syrup.rawValue)"
    }

    func makeSyrupCappuccino() -> String {
        var steps = super.makeCappuccino()
        steps += "\n4. Add syrup (\(syrup.rawValue))."
        return steps
    }

    override func description() -> String {
        return "A \(name) made with espresso, \(mlOfMilk)ml of steamed milk, and \(syrup.rawValue) syrup."
    }
}
