import SwiftUI

struct ContentView: View {
    @State private var messages: [String] = []

    var body: some View {
        VStack {
            Text("Coffee Shop")
                .font(.largeTitle)
                .padding()

            Button(action: makeCoffees) {
                Text("Make Coffees")
                    .font(.headline)
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            List(messages, id: \.self) { message in
                Text(message)
                    .padding()
            }
            .padding()
        }
    }

    func makeCoffees() {
        messages.removeAll()

        let coffees: [Coffee] = [
            Coffee(coffeeIntensity: .normal),
            Americano(coffeeIntensity: .strong, mlOfWater: 150),
            Cappuccino(coffeeIntensity: .light, mlOfMilk: 50),
            SyrupCappuccino(coffeeIntensity: .normal, mlOfMilk: 120, syrup: .vanilla),
            PumpkinSpiceLatte(coffeeIntensity: .strong, mlOfMilk: 150, mgOfPumpkinSpice: 50)
        ]

        for coffee in coffees {
            let steps = prepareCoffee(coffee: coffee)
            messages.append(steps)
        }
    }

    func prepareCoffee(coffee: Coffee) -> String {
        if let pumpkinSpiceLatte = coffee as? PumpkinSpiceLatte {
            return pumpkinSpiceLatte.makePumpkinSpiceLatte()
        } else if let syrupCappuccino = coffee as? SyrupCappuccino {
            return syrupCappuccino.makeSyrupCappuccino()
        } else if let cappuccino = coffee as? Cappuccino {
            return cappuccino.makeCappuccino()
        } else if let americano = coffee as? Americano {
            return americano.makeAmericano()
        } else {
            return coffee.make()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
