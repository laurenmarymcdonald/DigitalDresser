//
//  ClothingInfo.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/1/24.
//

import SwiftUI

struct ClothingItem {
    var name: String
    var image: UIImage
    var size: String
    var length: String
    var price: String
    var extraInfo: String
    var color: Binding<Color>
}

struct ClothingInfo: View {
    @EnvironmentObject var closetImages: Collection
    @Environment(\.dismiss) var dismiss
    var clothingItem: ClothingItem
    let sizes = ["XS", "Small", "Medium", "Large", "XL"]
    let lengthsTops = ["Short Sleeve", "Long Sleeve", "Sleeveless", "Tube top", "Crop Top"]
    let lengthsBottoms = ["Shorts", "Jeans", "Pants", "Short skirt", "Midi Skirt", "Long Skirt"]
    var name: String
    @Binding var size: String
    @Binding var length: String
    @Binding var price: String
    @Binding var extraInfo: String
    @Binding var color: Binding<Color>
    var body: some View {
        NavigationStack {
            Form {
                Image(uiImage: clothingItem.image)
                    .resizable()
                    .frame(width: 200, height: 230,alignment: .center) //center
                    .scaledToFit()
                Section {
                    Picker("Size", selection: $size) {
                        ForEach(sizes, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Length", selection: $length) {
                        if(name == "Tops") {
                            ForEach(lengthsTops, id: \.self) {
                                Text($0)
                            }
                        }
                        else{
                            ForEach(lengthsBottoms, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    LabeledContent {
                        TextField("Enter Price", text: $price)
                    } label: {
                      Text("Price")
                    }
                    LabeledContent {
                        TextField("Enter Info", text: $extraInfo)
                    } label: {
                      Text("Extra Information")
                    }
                    ColorPicker("Color", selection: color)
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
