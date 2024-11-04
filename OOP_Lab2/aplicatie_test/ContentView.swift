import SwiftUI

struct ContentView: View {
    @State private var messages: [String] = []

    var body: some View {
        VStack {
            Text("Coffee Shop")
                .font(.largeTitle)
                .padding()

            Button(action: brewCoffees) {
                Text("Brew Coffees")
                    .font(.headline)
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            List(messages, id: \.self) { message in
                Text(message)
            }
            .padding()
        }
    }

    func brewCoffees() {
        messages.removeAll()

        let coffees: [CoffeeProtocol] = [
            Coffee(coffeeIntensity: .normal),
            Americano(coffeeIntensity: .strong, mlOfWater: 150),
            Cappuccino(coffeeIntensity: .light, mlOfMilk: 100),
            SyrupCappuccino(coffeeIntensity: .normal, mlOfMilk: 120, syrup: .vanilla),
            PumpkinSpiceLatte(coffeeIntensity: .strong, mlOfMilk: 150, syrup: .caramel, mgOfPumpkinSpice: 50)
        ]

        for coffee in coffees {
            messages.append(coffee.brew())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
