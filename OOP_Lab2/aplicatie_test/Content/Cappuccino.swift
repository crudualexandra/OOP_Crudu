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

    override func printDetails() -> String {
        return "\(super.printDetails())\n\(name) milk: \(mlOfMilk)mg"
    }
}
