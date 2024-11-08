//
//  ClothingInfo.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/1/24.
//

import SwiftUI

struct ClothingInfo: View {
    @EnvironmentObject var collection: Collection
    @Environment(\.dismiss) var dismiss
    var clothingItem: ClothingItem
    let sizes = ["XS", "Small", "Medium", "Large", "XL"]
    let lengthsTops = ["Short Sleeve", "Long Sleeve", "Sleeveless", "Tube top", "Crop Top"]
    let lengthsBottoms = ["Shorts", "Jeans", "Pants", "Short skirt", "Midi Skirt", "Long Skirt"]
    let types = ["Dress", "Coat", "Sweater", "Jacket", "Shoes", "Accessories", "Other"]
    var name: String
    var buttonColor = Color(red: 205/255, green: 175/255, blue: 250/255)
    private var selectedArray: Binding<[ClothingItem]> {
        switch name {
        case "Tops":
            return $collection.topItems
        case "Bottoms":
            return $collection.bottomItems
        case "Favorites":
            return $collection.favorites
        default:
            return $collection.otherItems
        }
    }
    private var clothingItemIndex: Int? {
        selectedArray.wrappedValue.firstIndex(where: { $0.id == clothingItem.id })
    }

    var body: some View {
        NavigationStack {
            Form {
                if let clothingImage = UIImage(data: clothingItem.image.photo) {
                    Image(uiImage: clothingImage)
                        .resizable()
                        .frame(width: 200, height: 230, alignment: .center)
                        .scaledToFit()
                }
                
                if let index = clothingItemIndex {
                    Section {
                        Picker("Size", selection: selectedArray[index].size) {
                            ForEach(sizes, id: \.self) {
                                Text($0)
                            }
                        }
                        
                        if name == "Tops" || name == "Bottoms"{
                            Picker("Length", selection: selectedArray[index].length) {
                                ForEach(name == "Tops" ? lengthsTops : lengthsBottoms, id: \.self) {
                                    Text($0)
                                }
                            }
                        } else {
                            Picker("Type", selection: selectedArray[index].type) {
                                ForEach(types, id: \.self) {
                                    Text($0)
                                }
                            }
                        }
                        
                        LabeledContent {
                            TextField("Enter Price", text: selectedArray[index].price)
                        } label: {
                            Text("Price")
                        }.keyboardType(.decimalPad)
                        
                        LabeledContent {
                            TextField("Enter Info", text: selectedArray[index].extraInfo)
                        } label: {
                            Text("Extra Information")
                        }
                        
                        ColorPicker("Color", selection: selectedArray[index].color)
                        LabeledContent{
                            Button(action: {
                                selectedArray[index].favorite.wrappedValue.toggle()
                                collection.createFavorites()
                            }) {
                                Image(systemName: selectedArray[index].favorite.wrappedValue ? "heart.fill" : "heart")
                                    .foregroundColor(.accentColor)
                            }
                        }label: {
                            Text("Favorite")
                        }
                    }
                }
            }
            .navigationTitle("Clothing Info")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        dismiss()
                    }
                }
            }
        }
    }
}

