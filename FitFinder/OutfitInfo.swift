//
//  OutfitInfo.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/15/24.
//

import SwiftUI

struct OutfitItem {
    var clothingItemTop: ClothingItem
    var clothingItemBottom: ClothingItem
    var occasion: String
    var date: String
    var worn: Bool
}
struct OutfitInfo: View {
    @EnvironmentObject var closetImages: Collection
    @Environment(\.dismiss) var dismiss
    var outfitItem: OutfitItem
    @Binding var occasion: String
    @Binding var date: String
    @Binding var worn: Bool
    let wornList = ["Never", "Once", "Twice", "Multiple"]
    let lengthsTops = ["Short Sleeve", "Long Sleeve", "Sleeveless", "Tube top", "Crop Top"]
    let lengthsBottoms = ["Shorts", "Jeans", "Pants", "Short skirt", "Midi Skirt", "Long Skirt"]
    var body: some View {
        NavigationStack {
            Form {
                Image(uiImage: outfitItem.clothingItemTop.image)
                    .resizable()
                    .frame(width: 200, height: 230,alignment: .center) //center
                    .scaledToFit()
                Image(uiImage: outfitItem.clothingItemBottom.image)
                    .resizable()
                    .frame(width: 200, height: 230,alignment: .center) //center
                    .scaledToFit()
                Section {
                    Text("Top Size: " + outfitItem.clothingItemTop.size)
                    Text("Bottom Size: " + outfitItem.clothingItemBottom.size)
                    LabeledContent {
                        TextField("Enter Occasion", text: $occasion)
                    } label: {
                      Text("Occasion")
                    }
                    LabeledContent {
                        TextField("Enter Date", text: $date)
                    } label: {
                      Text("Date")
                    }
                    Picker("Worn before", selection: $worn) {
                        ForEach(wornList, id: \.self) {
                            Text($0)
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
