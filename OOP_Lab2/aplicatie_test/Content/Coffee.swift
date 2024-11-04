class Coffee: CoffeeProtocol {
    var name: String {
        return "Coffee"
    }
    var coffeeIntensity: Intensity

    init(coffeeIntensity: Intensity) {
        self.coffeeIntensity = coffeeIntensity
    }

    func brew() -> String {
        return "Brewing a \(name) with intensity \(coffeeIntensity)."
    }

    func printDetails() -> String {
        return "Coffee intensity: \(coffeeIntensity.rawValue)"
    }

    final func make() -> String {
        var steps = ""
        steps += "Making a basic \(name):\n"
        steps += "1. Grind coffee beans.\n"
        steps += "2. Brew coffee."
        return steps
    }
}
