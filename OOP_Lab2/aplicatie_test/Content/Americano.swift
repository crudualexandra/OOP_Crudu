class Americano: Coffee {
    override var name: String {
        return "Americano"
    }
    var mlOfWater: Int

    init(coffeeIntensity: Intensity, mlOfWater: Int) {
        self.mlOfWater = mlOfWater
        super.init(coffeeIntensity: coffeeIntensity)
    }

    override func brew() -> String {
        return super.brew() + " Water: \(mlOfWater)ml."
    }

    override func printDetails() -> String {
        return "\(super.printDetails())\n\(name) water: \(mlOfWater)ml"
    }
}
