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
    @State var image: CodableImage = CodableImage(photo: UIImage(systemName: "photo")!)
    @State private var bgColor = Color.white
    var buttonColor = Color(red: 205/255, green: 175/255, blue: 250/255)
    var body: some View {
        ScrollView(){
        NavigationStack {
            NavigationLink("Add Outfit") {
                Style(isCreatingOutfit: true)
            }
            .font(.custom("Georgia", size: 30))
            .buttonStyle(.borderedProminent)
            .tint(buttonColor)
            .fontWeight(.black)
            .foregroundColor(.white)
            }.frame(maxWidth: .infinity)
            ForEach(collection.outfits.indices.reversed(), id: \.self) { index in
                OutfitImageView(index: index, outfits: collection.outfits, isCreatingOutfit: false)
                Spacer()
            }
        }
    }
}


struct OutfitImageView: View {
    var index: Int
    var outfits: [OutfitItem]
    @EnvironmentObject var collection: Collection
    @State var showInfo = false
    var isCreatingOutfit: Bool
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: outfits[index].clothingItemTop.image.photo)!)
                .resizable()
                .frame(width: 200, height: 250)
                .scaledToFit()
                .padding(5)
            Image(uiImage: UIImage(data: outfits[index].clothingItemBottom.image.photo)!)
                .resizable()
                .frame(width: 200, height: 250)
                .scaledToFit()
                .padding(5)
            
            if !isCreatingOutfit {
                HStack {
                    Button(action: {
                        collection.deleteImage(at: index, from: "outfits")
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    
                    Button(action: { self.showInfo.toggle() }) {
                        Image(systemName: "info.circle").foregroundColor(.blue)
                    }
                    .sheet(isPresented: $showInfo) {
                        OutfitInfo(outfitItem: outfits[index])
                    }
                }
            }
        }
    }
}
