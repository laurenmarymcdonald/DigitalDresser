//
//  Closet.swift
//  FitFinder
//
//  Created by Lauren McDonald on 9/30/24.
//

import SwiftUI
import PhotosUI

struct TopsCloset: View {
    @EnvironmentObject var collection: Collection
    @State private var selectedItem: PhotosPickerItem?
    @State var image: CodableImage = CodableImage(photo: UIImage(systemName: "photo")!)
    @State private var bgColor = Color.white
    var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    
    var body: some View {
        ScrollView {
            VStack {
                    PhotosPicker("Add Top", selection: $selectedItem, matching: .images)
                        .onChange(of: selectedItem) {
                            Task {
                                if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                                    if let loadedImage = UIImage(data: data) {
                                        image = CodableImage(photo: loadedImage)
                                        let newItem = ClothingItem(name: "Tops", image: image, size: "None", length: "None", price: "Enter Price", extraInfo: "Enter Info", color: bgColor, favorite: false)
                                        collection.addItem(newItem, to: "Tops")
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
                }
                ForEach(collection.topItems.indices, id: \.self) { index in
                    ItemImageView(clothingItem: collection.topItems[index], index: index, title: "Tops", array: collection.topItems)
                        .padding(10)
                }
            }
        }
    }

struct BottomsCloset: View {
    @EnvironmentObject var collection: Collection
    @State private var selectedItem: PhotosPickerItem?
    @State var image: CodableImage = CodableImage(photo: UIImage(systemName: "photo")!)
    @State private var bgColor = Color.white
    var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    
    var body: some View {
        ScrollView {
            VStack {
                    PhotosPicker("Add Bottom", selection: $selectedItem, matching: .images)
                        .onChange(of: selectedItem) {
                            Task {
                                if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                                    if let loadedImage = UIImage(data: data) {
                                        image = CodableImage(photo: loadedImage)
                                        let newItem = ClothingItem(name: "Bottoms", image: image, size: "None", length: "None", price: "Enter Price", extraInfo: "Enter Info", color: bgColor, favorite: false)
                                        collection.addItem(newItem, to: "Bottoms")
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
                }
            ForEach(collection.bottomItems.indices, id: \.self) { index in
                ItemImageView(clothingItem: collection.bottomItems[index], index: index, title: "Bottoms", array: collection.bottomItems)
                        .padding(10)
                }
            }
        }
    }
struct OtherCloset: View {
    @EnvironmentObject var collection: Collection
    @State private var selectedItem: PhotosPickerItem?
    @State var image: CodableImage = CodableImage(photo: UIImage(systemName: "photo")!)
    @State private var bgColor = Color.white
    var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    
    var body: some View {
        ScrollView {
            VStack {
                    PhotosPicker("Add Other", selection: $selectedItem, matching: .images)
                        .onChange(of: selectedItem) {
                            Task {
                                if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                                    if let loadedImage = UIImage(data: data) {
                                        image = CodableImage(photo: loadedImage)
                                        let newItem = ClothingItem(name: "Other", image: image, size: "None", length: "None", price: "Enter Price", extraInfo: "Enter Info", color: bgColor, favorite: false)
                                        collection.addItem(newItem, to: "Other")
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
                }
            ForEach(collection.otherItems.indices, id: \.self) { index in
                ItemImageView(clothingItem: collection.otherItems[index], index: index, title: "Other", array: collection.otherItems)
                        .padding(10)
                }
            }
        }
    }
struct FavoritesCloset: View {
    @EnvironmentObject var collection: Collection
    @State private var selectedItem: PhotosPickerItem?
    @State var image: CodableImage = CodableImage(photo: UIImage(systemName: "photo")!)
    @State private var bgColor = Color.white
    var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer().frame(height: 40)
                Text("Home")
                    .font(.custom("Georgia", size: 37))
                    .fontWeight(.black)
                Spacer().frame(height: 50)
                }
            ForEach(collection.favorites.indices, id: \.self) { index in
                FavoriteItemImageView(clothingItem: collection.favorites[index], index: index, title: "Favorites", array: collection.favorites)
                        .padding(10)
                }
            }
        }
    }

struct ItemImageView: View {
    var clothingItem: ClothingItem
    var index: Int
    var title: String
    var array: [ClothingItem]
    @EnvironmentObject var collection: Collection
    @State var showInfo = false
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data:clothingItem.image.photo)!)
                .resizable()
                .frame(width: 200, height: 250)
                .scaledToFit()
                .padding(5)
            
            HStack {
                Button(action: {
                    collection.deleteImage(at: index, from: array[index].name)
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
                        size: array[index].size,
                        length: array[index].length,
                        price: array[index].price,
                        extraInfo: array[index].extraInfo,
                        color: array[index].color,
                        favorite: array[index].favorite
                    )
                }
            }
        }
    }
}
struct FavoriteItemImageView: View {
    var clothingItem: ClothingItem
    var index: Int
    var title: String
    var array: [ClothingItem]
    @EnvironmentObject var collection: Collection
    @State var showInfo = false
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data:clothingItem.image.photo)!)
                .resizable()
                .frame(width: 200, height: 250)
                .scaledToFit()
                .padding(5)
            
            HStack {
                Button(action: { self.showInfo.toggle() }) {
                    Image(systemName: "info.circle").foregroundColor(.blue)
                }
                .sheet(isPresented: $showInfo) {
                    ClothingInfo(
                        clothingItem: clothingItem,
                        name: title,
                        size: array[index].size,
                        length: array[index].length,
                        price: array[index].price,
                        extraInfo: array[index].extraInfo,
                        color: array[index].color,
                        favorite: array[index].favorite
                    )
                }
            }
        }
    }
}
