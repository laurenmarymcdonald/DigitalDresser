import SwiftUI

struct ContentView: View {
    @EnvironmentObject var collection: Collection
    private var buttonColor = Color(red: 205/255, green: 175/255, blue: 250/255)
    @State var showInfo: Bool = false
    var body: some View {
        NavigationStack {
                VStack{
                    HStack{
                        Spacer()
                        VStack {
                            Button(action: { self.showInfo.toggle() }) {
                                Image(systemName: "info.circle").foregroundColor(.accentColor)
                            }//FIX DOES NOT GO TO TOP RIGHT CORNER
                            .font(.title)
                            .sheet(isPresented: $showInfo) {
                                Text("App Information")
                                    .font(.custom("Georgia", size: 30))
                                    .fontWeight(.black)
                                Spacer().frame(height: 150)
                                Text("How to add to closet")
                                    .multilineTextAlignment(.center)
                                    .font(.custom("Georgia", size: 25))
                                    .fontWeight(.black)
                                Spacer().frame(height: 15)
                                Text("1) Click on My Closet")
                                    .font(.custom("Georgia", size: 20))
                                    .multilineTextAlignment(.center)
                                Text("2) Click on type of item")
                                    .font(.custom("Georgia", size: 20))
                                Text("3) Press Add and select image from camera roll")
                                    .font(.custom("Georgia", size: 20))
                                    .multilineTextAlignment(.center)
                                Text("4) Click on Info button to add descriptions and Trash button to delete")
                                    .font(.custom("Georgia", size: 20))
                                    .multilineTextAlignment(.center)
                                Spacer().frame(height: 35)
                                Text("How to make an outfit")
                                    .font(.custom("Georgia", size: 25))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.black)
                                Spacer().frame(height: 15)
                                Text("1) Click on Style Clothing")
                                    .font(.custom("Georgia", size: 20))
                                    .multilineTextAlignment(.center)
                                Text("2) Click on Make an Outfit")
                                    .font(.custom("Georgia", size: 20))
                                    .multilineTextAlignment(.center)
                                Text("3) Tap on top or bottom image to view a different clothing item")
                                    .font(.custom("Georgia", size: 20))
                                    .multilineTextAlignment(.center)
                                Text("4) Press Save and view your outfit in previous screen, View Outfits")
                                    .font(.custom("Georgia", size: 20))
                                    .multilineTextAlignment(.center)
                                Spacer().frame(height: 150)
                            }
                        }
                    }
                    VStack {
                        Spacer().frame(height: 40)
                        Text("Home")
                            .font(.custom("Georgia", size: 37))
                            .fontWeight(.black)
                        Spacer().frame(height: 150)
                }
                NavigationLink(destination: ClosetMenu()) {
                    Label("My Closet", systemImage: "hanger")
                }
                .font(.custom("Georgia", size: 30))
                .buttonStyle(.borderedProminent)
                .tint(buttonColor)
                .fontWeight(.black)
                .foregroundColor(.white)
                
                NavigationLink(destination: StyleMenu()) {
                    Label("Outfits", systemImage: "tshirt")
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
