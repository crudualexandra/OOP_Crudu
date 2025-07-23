// Americano.swift

import Foundation

class Americano: Coffee {
    override var name: String {
        return "Americano"
    }
    var mlOfWater: Int

    init(coffeeIntensity: Intensity, mlOfWater: Int) {
        self.mlOfWater = mlOfWater
        super.init(coffeeIntensity: coffeeIntensity)
    }

    override func printDetails() -> String {
        return "\(super.printDetails())\n\(name) water: \(mlOfWater)ml"
    }

    func makeAmericano() -> String {
        var steps = super.make()
        steps += "\n3. Add hot water (\(mlOfWater)ml)."
        return steps
    }

    override func description() -> String {
        return "An \(name) made by adding \(mlOfWater)ml of hot water to espresso."
    }
}
