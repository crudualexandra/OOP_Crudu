protocol CoffeeProtocol {
    var name: String { get }
    var coffeeIntensity: Intensity { get set }
    func brew() -> String
    func printDetails() -> String
}
