class SyrupCappuccino: Cappuccino {
    override var name: String {
        return "SyrupCappuccino"
    }
    var syrup: SyrupType

    init(coffeeIntensity: Intensity, mlOfMilk: Int, syrup: SyrupType) {
        self.syrup = syrup
        super.init(coffeeIntensity: coffeeIntensity, mlOfMilk: mlOfMilk)
    }

    override func brew() -> String {
        return super.brew() + " Syrup: \(syrup.rawValue)."
    }

    override func printDetails() -> String {
        return "\(super.printDetails())\n\(name) syrup: \(syrup.rawValue)"
    }
}
