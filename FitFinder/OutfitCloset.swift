//
//  OutfitCloset.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/10/24.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct OutfitCloset: View {
    @EnvironmentObject var closetImages: Collection
    @EnvironmentObject var collection: Collection
    @State private var selectedItem: PhotosPickerItem?
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
            /*ScrollView(.vertical) {
                ForEach(array.indices, id: \.self) { index in
                    ImageView(clothingItem: array[index], index: index, title: title, array: $array)
                }
            }*/
        }
    }
}

struct OutfitItem {
    var clothingItemTop: ClothingItem
    var clothingItemBottom: ClothingItem
}
/*
struct ClothingItemImageView: View {
    var clothingItemTop: ClothingItem
    var clothingItemBottom: ClothingItem
    var title: String
    @EnvironmentObject var closetImages: Collection
    @State var showInfo = false
    var body: some View {
        VStack {
            Image(uiImage: clothingItem.image)
                .resizable()
                .frame(width: 200, height: 250)
                .scaledToFit()
                .padding(5)
            
            HStack {
                Button(action: {
                    closetImages.deleteImage(at: index, from: $array)
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
                
                Button(action: { self.showInfo.toggle() }) {
                    Image(systemName: "info.circle").foregroundColor(.blue)
                }
                .sheet(isPresented: $showInfo) {
                    ClothingInfo(
                        clothingItem: clothingItem,
                        name: title,
                        size: $array[index].size,
                        length: $array[index].length,
                        price: $array[index].price,
                        extraInfo: $array[index].extraInfo,
                        color: $array[index].color
                    )
                }
            }
        }
    }
}*/

//NOTE: look at clothing item code and change for it to hold a top and bottom, display outfits on top of each other or side to side?
