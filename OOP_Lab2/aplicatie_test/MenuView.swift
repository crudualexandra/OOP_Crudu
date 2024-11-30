import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let details: String
}

struct MenuView: View {
    let menuItems: [MenuItem] = [
        MenuItem(name: "Coffee", details: Coffee(coffeeIntensity: .normal).description()),
        MenuItem(name: "Americano", details: Americano(coffeeIntensity: .normal, mlOfWater: 150).description()),
        MenuItem(name: "Cappuccino", details: Cappuccino(coffeeIntensity: .light, mlOfMilk: 50).description()),
        MenuItem(name: "Syrup Cappuccino", details: SyrupCappuccino(coffeeIntensity: .normal, mlOfMilk: 120, syrup: .vanilla).description()),
        MenuItem(name: "Pumpkin Spice Latte", details: PumpkinSpiceLatte(coffeeIntensity: .strong, mlOfMilk: 150, mgOfPumpkinSpice: 50).description())
    ]
    
    var body: some View {
        ZStack {
          
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
          
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            List(menuItems) { item in
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.name)
                        .font(.headline)
                        .foregroundColor(Color(hex: "#FFEDEB"))
                    Text(item.details)
                        .font(.subheadline)
                        .foregroundColor(Color(hex: "#9D8579"))
                }
                .padding()
                .background(Color.black.opacity(0.3))
                .cornerRadius(10)
            }
            .padding(.top, 50)
//            .listStyle(PlainListStyle())
            .navigationBarTitle("Menu", displayMode: .inline)
        }
    }
}



struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
