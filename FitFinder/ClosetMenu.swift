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
    var body: some View {
        NavigationStack {
            Text("My Closet")
                .font(.custom("Georgia", size: 37))
                .fontWeight(.black)
                .offset(y: -250)
            NavigationLink("Tops") {
                Closet(array: $collection.topItems, title: "Tops")
            }
            .font(.custom("Georgia", size: 30))
            .buttonStyle(.borderedProminent)
            .tint(buttonColor)
            .fontWeight(.black)
            .foregroundColor(.white)
            
            NavigationLink("Bottoms") {
                Closet(array: $collection.bottomItems, title: "Bottoms")
            }
            .font(.custom("Georgia", size: 30))
            .buttonStyle(.borderedProminent)
            .tint(buttonColor)
            .fontWeight(.black)
            .foregroundColor(.white)
            NavigationLink("Other") {
                Closet(array: $collection.otherItems, title: "Other")
            }
            .font(.custom("Georgia", size: 30))
            .buttonStyle(.borderedProminent)
            .tint(buttonColor)
            .fontWeight(.black)
            .foregroundColor(.white)
        }
    }
}

#Preview {
    ClosetMenu()
}
