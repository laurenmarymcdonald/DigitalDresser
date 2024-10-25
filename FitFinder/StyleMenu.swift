//
//  StyleMenu.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/7/24.
//

import SwiftUI

struct StyleMenu: View {
    @EnvironmentObject var collection: Collection
    private var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    var body: some View {
        NavigationStack {
            Text("Style")
                .font(.custom("Georgia", size: 37))
                .fontWeight(.black)
                .offset(y: -250)
            NavigationLink("Make an Outfit") {
                Style()
            }
            .font(.custom("Georgia", size: 30))
            .buttonStyle(.borderedProminent)
            .tint(buttonColor)
            .fontWeight(.black)
            .foregroundColor(.white)
            
            NavigationLink("View Saved Outfit") {
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

