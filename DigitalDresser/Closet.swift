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
    @State private var showInfo = false
    @State private var newItem: ClothingItem?
    var buttonColor = Color(red: 205/255, green: 175/255, blue: 250/255)

    var body: some View {
        ScrollView {
            VStack {
                Spacer().frame(height: 40)
                PhotosPicker("Add Top", selection: $selectedItem, matching: .images)
                    .onChange(of: selectedItem) {
                        Task {
                            if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                                if let loadedImage = UIImage(data: data) {
                                    image = CodableImage(photo: loadedImage)
                                    let newItem = ClothingItem(
                                        name: "Tops",
                                        image: image,
                                        size: "None",
                                        length: "None",
                                        price: "",
                                        extraInfo: "",
                                        type: "Type",
                                        color: bgColor,
                                        favorite: false
                                    )
                                    collection.addItem(newItem, to: "Tops")
                                    self.newItem = newItem
                                    self.showInfo = true
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
            .frame(maxWidth: .infinity)

            ForEach(collection.topItems.indices.reversed(), id: \ .self) { index in
                ItemImageView(
                    clothingItem: collection.topItems[index],
                    index: index,
                    title: "Tops",
                    array: collection.topItems,
                    notStyleView: false
                )
                .padding(10)
            }
        }
        .sheet(isPresented: $showInfo) {
            if let newItem = newItem {
                ClothingInfo(clothingItem: newItem, name: "Tops")
            }
        }
    }
}

struct BottomsCloset: View {
    @EnvironmentObject var collection: Collection
    @State private var selectedItem: PhotosPickerItem?
    @State var image: CodableImage = CodableImage(photo: UIImage(systemName: "photo")!)
    @State private var bgColor = Color.white
    @State private var showInfo = false
    @State private var newItem: ClothingItem?
    var buttonColor = Color(red: 205/255, green: 175/255, blue: 250/255)

    var body: some View {
        ScrollView {
            VStack {
                PhotosPicker("Add Bottom", selection: $selectedItem, matching: .images)
                    .onChange(of: selectedItem) {
                        Task {
                            if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                                if let loadedImage = UIImage(data: data) {
                                    image = CodableImage(photo: loadedImage)
                                    let newItem = ClothingItem(
                                        name: "Bottoms",
                                        image: image,
                                        size: "None",
                                        length: "None",
                                        price: "",
                                        extraInfo: "",
                                        type: "Type",
                                        color: bgColor,
                                        favorite: false
                                    )
                                    collection.addItem(newItem, to: "Bottoms")
                                    self.newItem = newItem
                                    self.showInfo = true
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
            .frame(maxWidth: .infinity)

            ForEach(collection.bottomItems.indices.reversed(), id: \ .self) { index in
                ItemImageView(
                    clothingItem: collection.bottomItems[index],
                    index: index,
                    title: "Bottoms",
                    array: collection.bottomItems,
                    notStyleView: false
                )
                .padding(10)
            }
        }
        .sheet(isPresented: $showInfo) {
            if let newItem = newItem {
                ClothingInfo(clothingItem: newItem, name: "Bottoms")
            }
        }
    }
}

struct OtherCloset: View {
    @EnvironmentObject var collection: Collection
    @State private var selectedItem: PhotosPickerItem?
    @State var image: CodableImage = CodableImage(photo: UIImage(systemName: "photo")!)
    @State private var bgColor = Color.white
    @State private var showInfo = false
    @State private var newItem: ClothingItem?
    var buttonColor = Color(red: 205/255, green: 175/255, blue: 250/255)

    var body: some View {
        ScrollView {
            VStack {
                PhotosPicker("Add Other", selection: $selectedItem, matching: .images)
                    .onChange(of: selectedItem) {
                        Task {
                            if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                                if let loadedImage = UIImage(data: data) {
                                    image = CodableImage(photo: loadedImage)
                                    let newItem = ClothingItem(
                                        name: "Other",
                                        image: image,
                                        size: "None",
                                        length: "None",
                                        price: "",
                                        extraInfo: "",
                                        type: "Type",
                                        color: bgColor,
                                        favorite: false
                                    )
                                    collection.addItem(newItem, to: "Other")
                                    self.newItem = newItem
                                    self.showInfo = true
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
            .frame(maxWidth: .infinity)

            ForEach(collection.otherItems.indices.reversed(), id: \ .self) { index in
                ItemImageView(
                    clothingItem: collection.otherItems[index],
                    index: index,
                    title: "Other",
                    array: collection.otherItems,
                    notStyleView: false
                )
                .padding(10)
            }
        }
        .sheet(isPresented: $showInfo) {
            if let newItem = newItem {
                ClothingInfo(clothingItem: newItem, name: "Other")
            }
        }
    }
}

struct ShoesCloset: View {
    @EnvironmentObject var collection: Collection
    @State private var selectedItem: PhotosPickerItem?
    @State var image: CodableImage = CodableImage(photo: UIImage(systemName: "photo")!)
    @State private var bgColor = Color.white
    @State private var showInfo = false
    @State private var newItem: ClothingItem?
    var buttonColor = Color(red: 205/255, green: 175/255, blue: 250/255)

    var body: some View {
        ScrollView {
            VStack {
                Spacer().frame(height: 40)
                PhotosPicker("Add Shoes", selection: $selectedItem, matching: .images)
                    .onChange(of: selectedItem) {
                        Task {
                            if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                                if let loadedImage = UIImage(data: data) {
                                    image = CodableImage(photo: loadedImage)
                                    let newItem = ClothingItem(
                                        name: "Shoes",
                                        image: image,
                                        size: "None",
                                        length: "None",
                                        price: "",
                                        extraInfo: "",
                                        type: "Type",
                                        color: bgColor,
                                        favorite: false
                                    )
                                    collection.addItem(newItem, to: "Shoes")
                                    self.newItem = newItem
                                    self.showInfo = true
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
            .frame(maxWidth: .infinity)

            ForEach(collection.shoesItems.indices.reversed(), id: \ .self) { index in
                ItemImageView(
                    clothingItem: collection.shoesItems[index],
                    index: index,
                    title: "Shoes",
                    array: collection.shoesItems,
                    notStyleView: false
                )
                .padding(10)
            }
        }
        .sheet(isPresented: $showInfo) {
            if let newItem = newItem {
                ClothingInfo(clothingItem: newItem, name: "Shoes")
            }
        }
    }
}
struct FavoritesCloset: View {
    @EnvironmentObject var collection: Collection
    @State private var selectedItem: PhotosPickerItem?
    @State var image: CodableImage = CodableImage(photo: UIImage(systemName: "photo")!)
    @State private var bgColor = Color.white
    var buttonColor = Color(red: 205/255, green: 175/255, blue: 250/255)
    private var informationBackgroundColor = Color(red: 227/255, green: 211/255, blue: 252/255)
    var body: some View {
        ScrollView {
            VStack {
                Spacer().frame(height: 40)
                Text("Favorites")
                    .font(.custom("Georgia", size: 37))
                    .fontWeight(.black)
                Spacer().frame(height: 50)
                }.frame(maxWidth: .infinity)
            ForEach(collection.favorites.indices.reversed(), id: \.self) { index in
                FavoriteItemImageView(clothingItem: collection.favorites[index])
                        .padding(10)
                }
            }
        }
    }
extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 250) // Desired size
                .clipped() // Ensures the content is cropped to fit
        }
        .frame(width: 200, height: 250) // Final bounding size
    }
}
struct ItemImageView: View {
    var clothingItem: ClothingItem
    var index: Int
    var title: String
    var array: [ClothingItem]
    var notStyleView: Bool
    @EnvironmentObject var collection: Collection
    @State var showInfo = false
    @State private var showDeleteConfirmation = false
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data:clothingItem.image.photo)!)
                .resizable()
                .centerCropped()
                .scaledToFit()
                .padding(5)
            if(notStyleView == false) {
                HStack {
                    Button(action: {
                        showDeleteConfirmation = true
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    .alert(isPresented: $showDeleteConfirmation) {
                        Alert(
                            title: Text("Confirm Deletion"),
                            message: Text("Are you sure you want to delete this item?"),
                            primaryButton: .destructive(Text("Delete")) {
                                collection.deleteImage(at: index, from: array[index].name)
                            },
                            secondaryButton: .cancel()
                        )
                    }
                    Button(action: { self.showInfo.toggle() }) {
                        Image(systemName: "info.circle").foregroundColor(.blue)
                    }
                    .sheet(isPresented: $showInfo) {
                        ClothingInfo(
                            clothingItem: clothingItem,
                            name: title
                        )
                    }
                }
            }
        }
    }
}
struct FavoriteItemImageView: View {
    var clothingItem: ClothingItem
    @EnvironmentObject var collection: Collection
    @State var showInfo = false
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data:clothingItem.image.photo)!)
                .resizable()
                .frame(width: 200, height: 250)
                .scaledToFit()
                .padding(5)
        }
    }
}
