//
//  OutfitInfo.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/15/24.
//

import SwiftUI

struct OutfitItem: Codable {
    var id = UUID()
    var clothingItemTop: ClothingItem
    var clothingItemBottom: ClothingItem
    var occasion: String
    var date: String
    var worn: String
    init(id: UUID, clothingItemTop: ClothingItem, clothingItemBottom: ClothingItem, occasion: String, date: String, worn: String) {
            self.id = id
            self.clothingItemTop = clothingItemTop
            self.clothingItemBottom = clothingItemBottom
            self.occasion = occasion
            self.date = date
            self.worn = worn
        }
    enum CodingKeys: String, CodingKey {
        case id, clothingItemTop, clothingItemBottom, occasion, date, worn
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(clothingItemTop, forKey: .clothingItemTop)
        try container.encode(clothingItemBottom, forKey: .clothingItemBottom)
        try container.encode(occasion, forKey: .occasion)
        try container.encode(date, forKey: .date)
        try container.encode(worn, forKey: .worn)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        clothingItemTop = try container.decode(ClothingItem.self, forKey: .clothingItemTop)
        clothingItemBottom = try container.decode(ClothingItem.self, forKey: .clothingItemBottom)
        occasion = try container.decode(String.self, forKey: .occasion)
        date = try container.decode(String.self, forKey: .date)
        worn = try container.decode(String.self, forKey: .worn)
        
    }
}
struct OutfitInfo: View {
    @EnvironmentObject var collection: Collection
    @Environment(\.dismiss) var dismiss
    var outfitItem: OutfitItem
    let wornList = ["Never", "Once", "Twice", "Multiple"]
    let lengthsTops = ["Short Sleeve", "Long Sleeve", "Sleeveless", "Tube top", "Crop Top"]
    let lengthsBottoms = ["Shorts", "Jeans", "Pants", "Short skirt", "Midi Skirt", "Long Skirt"]
    var outfitItemIndex: Int {
        collection.outfits.firstIndex(where: {$0.id == outfitItem.id})!
    }
    var body: some View {
        NavigationStack {
            Form {
                Image(uiImage: UIImage(data: outfitItem.clothingItemTop.image.photo)!)
                    .resizable()
                    .frame(width: 200, height: 230,alignment: .center)
                    .scaledToFit()
                Image(uiImage: UIImage(data: outfitItem.clothingItemBottom.image.photo)!)
                    .resizable()
                    .frame(width: 200, height: 230,alignment: .center)
                    .scaledToFit()
                Section {
                    Text("Top Size: " + outfitItem.clothingItemTop.size)
                    Text("Bottom Size: " + outfitItem.clothingItemBottom.size)
                    LabeledContent {
                        TextField("Enter Occasion", text: $collection.outfits[outfitItemIndex].occasion)
                    } label: {
                      Text("Occasion")
                    }
                    LabeledContent {
                        TextField("Enter Date", text: $collection.outfits[outfitItemIndex].date)
                    } label: {
                      Text("Date")
                    }
                    Picker("Worn before", selection: $collection.outfits[outfitItemIndex].worn) {
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
