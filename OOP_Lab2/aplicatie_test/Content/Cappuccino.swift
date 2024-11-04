// Cappuccino.swift

import Foundation

class Cappuccino: Coffee {
    override var name: String {
        return "Cappuccino"
    }
    var mlOfMilk: Int

    init(coffeeIntensity: Intensity, mlOfMilk: Int) {
        self.mlOfMilk = mlOfMilk
        super.init(coffeeIntensity: coffeeIntensity)
    }

    override func printDetails() -> String {
        return "\(super.printDetails())\n\(name) milk: \(mlOfMilk)mg"
    }

    func makeCappuccino() -> String {
        var steps = super.make()
        steps += "\n3. Add steamed milk (\(mlOfMilk)ml)."
        return steps
    }

    override func description() -> String {
        return "A \(name) made with espresso and \(mlOfMilk)ml of steamed milk."
    }
}
