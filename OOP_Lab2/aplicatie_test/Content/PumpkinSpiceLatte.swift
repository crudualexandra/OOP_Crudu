class PumpkinSpiceLatte: Cappuccino {
    override var name: String {
        return "PumpkinSpiceLatte"
    }
    var mgOfPumpkinSpice: Int

    init(coffeeIntensity: Intensity, mlOfMilk: Int, mgOfPumpkinSpice: Int) {
        self.mgOfPumpkinSpice = mgOfPumpkinSpice
        super.init(coffeeIntensity: coffeeIntensity, mlOfMilk: mlOfMilk)
    }

    func makePumpkinSpiceLatte() -> String {
        var steps = super.makeCappuccino()
        steps += "\n4. Add pumpkin spice (\(mgOfPumpkinSpice)mg)."
        return steps
    }
}
