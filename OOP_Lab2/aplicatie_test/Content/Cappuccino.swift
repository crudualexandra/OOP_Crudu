class Cappuccino: Coffee {
    override var name: String {
        return "Cappuccino"
    }
    var mlOfMilk: Int

    init(coffeeIntensity: Intensity, mlOfMilk: Int) {
        self.mlOfMilk = mlOfMilk
        super.init(coffeeIntensity: coffeeIntensity)
    }

    func makeCappuccino() -> String {
        var steps = super.make()
        steps += "\n3. Add steamed milk (\(mlOfMilk)ml)."
        return steps
    }
}
