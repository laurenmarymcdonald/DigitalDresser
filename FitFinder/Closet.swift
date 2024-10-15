//
//  Closet.swift
//  FitFinder
//
//  Created by Lauren McDonald on 9/30/24.
//

import SwiftUI
import PhotosUI

struct Closet: View {
    @EnvironmentObject var closetImages: Collection
    @Binding var array: [ClothingItem]
    @State var title: String
    @EnvironmentObject var collection: Collection
    @State private var selectedItem: PhotosPickerItem?
    @State var image: UIImage?
    @State private var bgColor = Color.white
    var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    var body: some View {
        NavigationStack {
            PhotosPicker("Add " + title, selection: $selectedItem, matching: .images)
                .onChange(of: selectedItem) {
                    Task {
                        if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                            if let loadedImage = UIImage(data: data) {
                                image = loadedImage
                                let newItem = ClothingItem(name: title, image: loadedImage, size: "None", length: "None", price: "Enter Price", extraInfo: "Enter Info", color: $bgColor)
                                array.append(newItem)
                            } else {
                                print("Failed to load the image")
                            }
                        }
                    }
                }
                .font(.custom("Georgia", size: 30))
                .buttonStyle(.borderedProminent)
                .tint(buttonColor)
                .fontWeight(.black)
                .foregroundColor(.white)
            ScrollView(.vertical) {
                ForEach(array.indices, id: \.self) { index in
                    ItemImageView(clothingItem: array[index], index: index, title: title, array: $array)
                }
            }
        }
    }
}
struct ItemImageView: View {
    var clothingItem: ClothingItem
    var index: Int
    var title: String
    @Binding var array: [ClothingItem]
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
}

