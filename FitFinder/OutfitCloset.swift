//
//  OutfitCloset.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/10/24.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct OutfitCloset: View {
    @EnvironmentObject var collection: Collection
   // @Binding var outfits: [OutfitItem]
    @State var image: UIImage?
    @State private var bgColor = Color.white
    var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    var body: some View {
        NavigationStack {
            NavigationLink("Add Outfit") {
                Style()
            }
            .font(.custom("Georgia", size: 30))
            .buttonStyle(.borderedProminent)
            .tint(buttonColor)
            .fontWeight(.black)
            .foregroundColor(.white)
            ScrollView(.vertical) {
                ForEach(collection.outfits.indices, id: \.self) { index in
                    OutfitImageView(index: index, outfits: $collection.outfits)
                }
            }
        }
    }
}



struct OutfitImageView: View {
    var index: Int
    @Binding var outfits: [OutfitItem]
    @EnvironmentObject var collection: Collection
    @State var showInfo = false
    var body: some View {
        VStack {
            Image(uiImage: outfits[index].clothingItemTop.image)
                .resizable()
                .frame(width: 200, height: 250)
                .scaledToFit()
                .padding(5)
            Image(uiImage: outfits[index].clothingItemBottom.image)
                .resizable()
                .frame(width: 200, height: 250)
                .scaledToFit()
                .padding(5)
            HStack {
                Button(action: {
                    collection.deleteOutfit(at: index, from: $outfits)
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
                
                Button(action: { self.showInfo.toggle() }) {
                    Image(systemName: "info.circle").foregroundColor(.blue)
                }
                .sheet(isPresented: $showInfo) {
                    OutfitInfo(
                        outfitItem: outfits[index],
                        occasion: $outfits[index].occasion,
                        date: $outfits[index].date,
                        worn: $outfits[index].worn
                    )
                }
            }
        }
    }
}

