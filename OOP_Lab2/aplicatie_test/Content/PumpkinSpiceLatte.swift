class PumpkinSpiceLatte: SyrupCappuccino {
    override var name: String {
        return "PumpkinSpiceLatte"
    }
    var mgOfPumpkinSpice: Int

    init(coffeeIntensity: Intensity, mlOfMilk: Int, syrup: SyrupType, mgOfPumpkinSpice: Int) {
        self.mgOfPumpkinSpice = mgOfPumpkinSpice
        super.init(coffeeIntensity: coffeeIntensity, mlOfMilk: mlOfMilk, syrup: syrup)
    }

    override func brew() -> String {
        return super.brew() + " Pumpkin Spice: \(mgOfPumpkinSpice)mg."
    }

    override func printDetails() -> String {
        return "\(super.printDetails())\n\(name) pumpkin spice: \(mgOfPumpkinSpice)mg"
    }
}
