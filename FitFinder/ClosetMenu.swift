//
//  ClosetMenu.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/3/24.
//

import SwiftUI

struct ClosetMenu: View {
    @EnvironmentObject var collection: Collection
    private var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    private var backgroundColor = Color(red: 240/255, green: 230/255, blue: 255/255)

    var body: some View {
        NavigationStack {
            Spacer().frame(height: 20)
            Text("My Closet")
                .font(.custom("Georgia", size: 37))
                .fontWeight(.black)
            Spacer()
            VStack(spacing: 20) {
                NavigationLink("Tops") {
                    TopsCloset()
                }
                .font(.custom("Georgia", size: 30))
                .buttonStyle(.borderedProminent)
                .tint(buttonColor)
                .fontWeight(.black)
                .foregroundColor(.white)
                
                NavigationLink("Bottoms") {
                    BottomsCloset()
                }
                .font(.custom("Georgia", size: 30))
                .buttonStyle(.borderedProminent)
                .tint(buttonColor)
                .fontWeight(.black)
                .foregroundColor(.white)
                
                NavigationLink("Other") {
                    OtherCloset()
                }
                .font(.custom("Georgia", size: 30))
                .buttonStyle(.borderedProminent)
                .tint(buttonColor)
                .fontWeight(.black)
                .foregroundColor(.white)
                
                NavigationLink("Favorites") {
                    FavoritesCloset()
                }
                .font(.custom("Georgia", size: 30))
                .buttonStyle(.borderedProminent)
                .tint(buttonColor)
                .fontWeight(.black)
                .foregroundColor(.white)
            }
            Spacer()
        }
    }
}
