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
}
