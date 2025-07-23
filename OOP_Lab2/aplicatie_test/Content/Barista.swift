import Foundation

public class Barista {
    public init() {}

    // handling orders
    public func takeOrder(coffeeOrders: [String: Int]) -> [String] {
        var outputMessages: [String] = []
        for (orderName, quantity) in coffeeOrders {
            for _ in 0..<quantity {
                let message = makeBeverage(orderName: orderName)
                outputMessages.append(message)
            }
        }
        return outputMessages
    }

    // managing a single beverage
    public func makeBeverage(orderName: String) -> String {
        if let coffee = prepareCoffee(orderName: orderName) {
            let details = coffee.printDetails()
            let steps = makeCoffee(coffee: coffee)
            let message = "\(coffee.name)\n\(details)\n\(steps)"
            return message
        } else {
            return "Sorry, we don't serve \(orderName)."
        }
    }

    // object creation
    private func prepareCoffee(orderName: String) -> CoffeeProtocol? {
        switch orderName.lowercased() {
        case "coffee":
            return Coffee(coffeeIntensity: .normal)
        case "americano":
            return Americano(coffeeIntensity: .normal, mlOfWater: 150)
        case "cappuccino":
            return Cappuccino(coffeeIntensity: .light, mlOfMilk: 50)
        case "syrup cappuccino":
            return SyrupCappuccino(coffeeIntensity: .normal, mlOfMilk: 120, syrup: .vanilla)
        case "pumpkin spice latte":
            return PumpkinSpiceLatte(coffeeIntensity: .strong, mlOfMilk: 150, mgOfPumpkinSpice: 50)
        default:
            return nil
        }
    }
    //detailed preparation
    private func makeCoffee(coffee: CoffeeProtocol) -> String {
        if let pumpkinSpiceLatte = coffee as? PumpkinSpiceLatte {
            return pumpkinSpiceLatte.makePumpkinSpiceLatte()
        } else if let syrupCappuccino = coffee as? SyrupCappuccino {
            return syrupCappuccino.makeSyrupCappuccino()
        } else if let cappuccino = coffee as? Cappuccino {
            return cappuccino.makeCappuccino()
        } else if let americano = coffee as? Americano {
            return americano.makeAmericano()
        } else if let basicCoffee = coffee as? Coffee {
            return basicCoffee.make()
        } else {
            return "Unknown coffee type."
        }
    }
}
