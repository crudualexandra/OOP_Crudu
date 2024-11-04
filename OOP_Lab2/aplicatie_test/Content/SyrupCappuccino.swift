class SyrupCappuccino: Cappuccino {
    override var name: String {
        return "SyrupCappuccino"
    }
    var syrup: SyrupType

    init(coffeeIntensity: Intensity, mlOfMilk: Int, syrup: SyrupType) {
        self.syrup = syrup
        super.init(coffeeIntensity: coffeeIntensity, mlOfMilk: mlOfMilk)
    }

    func makeSyrupCappuccino() -> String {
        var steps = super.makeCappuccino()
        steps += "\n4. Add syrup (\(syrup.rawValue))."
        return steps
    }
}
