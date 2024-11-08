//
//  StyleMenu.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/7/24.
//

import SwiftUI

struct StyleMenu: View {
    @EnvironmentObject var collection: Collection
    private var buttonColor = Color(red: 205/255, green: 175/255, blue: 250/255)
    var body: some View {
        NavigationStack {
            Text("Outfits")
                .font(.custom("Georgia", size: 37))
                .fontWeight(.black)
                .offset(y: -250)
            NavigationLink("Make an Outfit") {
                Style(isCreatingOutfit: true)
            }
            .font(.custom("Georgia", size: 30))
            .buttonStyle(.borderedProminent)
            .tint(buttonColor)
            .fontWeight(.black)
            .foregroundColor(.white)
            
            NavigationLink("View Outfits") {
                OutfitCloset()
            }
            .font(.custom("Georgia", size: 30))
            .buttonStyle(.borderedProminent)
            .tint(buttonColor)
            .fontWeight(.black)
            .foregroundColor(.white)
        }
    }
}

