import SwiftUI

struct RecipeMessage: Identifiable {
    let id = UUID()
    let content: String
}

struct OrderView: View {
    @State private var messages: [RecipeMessage] = []
    private let barista = Barista()


    @State private var coffeeOrders: [String: Int] = [:]
    let beverageOptions = ["Coffee", "Americano", "Cappuccino", "Syrup Cappuccino", "Pumpkin Spice Latte"]

    var body: some View {
        ZStack {
            
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
       
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Select Beverages")
                    .font(.headline)
                    .foregroundColor(Color(hex: "#FFEDEB"))
                    .padding()

               
                ForEach(beverageOptions, id: \.self) { beverage in
                    HStack {
                        Text(beverage)
                            .foregroundColor(.white)
                        Spacer()
                        Text("Quantity: \(self.coffeeOrders[beverage] ?? 0)")
                            .foregroundColor(.white)
                        Stepper(value: Binding(
                            get: { self.coffeeOrders[beverage] ?? 0 },
                            set: { self.coffeeOrders[beverage] = $0 }
                        ), in: 0...10) {
                            EmptyView()
                        }
                        .labelsHidden()
                        .frame(width: 100)
                    }
                    .padding(.horizontal)
                }

                Button(action: {
                    orderSelectedBeverages()
                }) {
                    Text("Order")
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(Color(hex: "#9D8579"))
                        .foregroundColor(Color(hex: "#FFEDEB"))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding()

                List(messages) { message in
                    Text(message.content)
                        .foregroundColor(Color(hex: "#FFEDEB"))
                        .padding()
                        .background(Color(hex: "#9D8579"))
                        .cornerRadius(8)
                }
                
                .background(Color.clear)
            }
            .padding()
            .navigationBarTitle("", displayMode: .inline)
        }
    }

    func orderSelectedBeverages() {
        messages.removeAll()
        let orders = coffeeOrders.filter { $0.value > 0 }
        if orders.isEmpty {
            messages.append(RecipeMessage(content: "Please select at least one beverage."))
            return
        }
        let baristaOutput = barista.takeOrder(coffeeOrders: orders)
        for output in baristaOutput {
            messages.append(RecipeMessage(content: output))
        }
    }
}



struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
