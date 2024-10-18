import SwiftUI

struct ContentView: View {
    private var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    var body: some View {
        NavigationStack {
                Text("Home")
                    .font(.custom("Georgia", size: 37))
                    .fontWeight(.black)
                    .offset(y: -250)
                
                NavigationLink(destination: ClosetMenu()) {
                    Label("My Closet", systemImage: "hanger")
                }
                .font(.custom("Georgia", size: 30))
                .buttonStyle(.borderedProminent)
                .tint(buttonColor)
                .fontWeight(.black)
                .foregroundColor(.white)
                
                NavigationLink(destination: StyleMenu()) {
                    Label("Style Clothing", systemImage: "tshirt")
                }
                .font(.custom("Georgia", size: 30))
                .buttonStyle(.borderedProminent)
                .tint(buttonColor)
                .fontWeight(.black)
                .foregroundColor(.white)
        }
        
    }
}


