import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                Spacer()
                
                
                
                Spacer()
                
                VStack(spacing: 10) {
                    // Button Style
                    let buttonWidth: CGFloat = 300
                    let buttonHeight: CGFloat = 50
                    let buttonColor = Color(hex: "#FFEDEB")
                    let textColor = Color(hex:  "#9D8579")
                    
                    NavigationLink(destination: OrderView()) {
                        Text("Order Coffee")
                            .font(.custom("CustomFont", size: 20))
                            .frame(width: buttonWidth, height: buttonHeight)
                            .background(buttonColor)
                            .foregroundColor(textColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    
                    NavigationLink(destination: MenuView()) {
                        Text("View Menu")
                            .font(.custom("", size: 20))
                            .frame(width: buttonWidth, height: buttonHeight)
                            .background(buttonColor)
                            .foregroundColor(textColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding(.bottom, 300)
            }
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            .background(
                Image("Coffee Shop")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.bottom)
                    .edgesIgnoringSafeArea(.top)
                
            )
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
