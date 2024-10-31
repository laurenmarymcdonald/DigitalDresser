import SwiftUI

struct ContentView: View {
    @EnvironmentObject var collection: Collection
    private var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height: 40)
                Text("Home")
                    .font(.custom("Georgia", size: 37))
                    .fontWeight(.black)
                Spacer().frame(height: 150)
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
                
                if !collection.favorites.isEmpty {
                    VStack {
                        Text("Favorites")
                            .padding(.top, 20)
                            .font(.custom("Georgia", size: 15))
                            .buttonStyle(.borderedProminent)
                            .tint(buttonColor)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                        HStack {
                            ForEach(0..<min(collection.favorites.count, 3), id: \.self) { index in
                                Image(uiImage: UIImage(data: collection.favorites[index].image.photo)!)
                                    .resizable()
                                    .frame(width: 100, height: 120)
                                    .scaledToFit()
                                    .padding()
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}
