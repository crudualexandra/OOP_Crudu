// PumpkinSpiceLatte.swift

import Foundation

class PumpkinSpiceLatte: Cappuccino {
    override var name: String {
        return "Pumpkin Spice Latte"
    }
    var mgOfPumpkinSpice: Int

    init(coffeeIntensity: Intensity, mlOfMilk: Int, mgOfPumpkinSpice: Int) {
        self.mgOfPumpkinSpice = mgOfPumpkinSpice
        super.init(coffeeIntensity: coffeeIntensity, mlOfMilk: mlOfMilk)
    }

    override func printDetails() -> String {
        return "\(super.printDetails())\n\(name) pumpkin spice: \(mgOfPumpkinSpice)mg"
    }

    func makePumpkinSpiceLatte() -> String {
        var steps = super.makeCappuccino()
        steps += "\n4. Add pumpkin spice (\(mgOfPumpkinSpice)mg)."
        return steps
    }

    override func description() -> String {
        return "A \(name) made with espresso, \(mlOfMilk)ml of steamed milk, and \(mgOfPumpkinSpice)mg of pumpkin spice."
    }
}
