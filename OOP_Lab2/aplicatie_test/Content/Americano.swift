class Americano: Coffee {
    override var name: String {
        return "Americano"
    }
    var mlOfWater: Int

    init(coffeeIntensity: Intensity, mlOfWater: Int) {
        self.mlOfWater = mlOfWater
        super.init(coffeeIntensity: coffeeIntensity)
    }

    func makeAmericano() -> String {
        var steps = super.make()
        steps += "\n3. Add hot water (\(mlOfWater)ml)."
        return steps
    }
}
