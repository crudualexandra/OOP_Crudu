class Cappuccino: Coffee {
    override var name: String {
        return "Cappuccino"
    }
    var mlOfMilk: Int

    init(coffeeIntensity: Intensity, mlOfMilk: Int) {
        self.mlOfMilk = mlOfMilk
        super.init(coffeeIntensity: coffeeIntensity)
    }

    override func brew() -> String {
        return super.brew() + " Milk: \(mlOfMilk)ml."
    }
}
