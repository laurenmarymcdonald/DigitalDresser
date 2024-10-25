//
//  ClothingInfo.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/1/24.
//

/*import SwiftUI

struct ClothingItem: Codable {
    var name: String
    var image: CodableImage
    var size: String
    var length: String
    var price: String
    var extraInfo: String
    var color: Color //make color codeable
    var favorite: Bool
}*/

import SwiftUI

struct ClothingItem: Codable {
    var id = UUID()
    var name: String
    var image: CodableImage
    var size: String
    var length: String
    var price: String
    var extraInfo: String
    var color: Color
    var favorite: Bool
    init(name: String, image: CodableImage, size: String, length: String, price: String, extraInfo: String, color: Color, favorite: Bool) {
            self.name = name
            self.image = image
            self.size = size
            self.length = length
            self.price = price
            self.extraInfo = extraInfo
            self.color = color
            self.favorite = favorite
        }
    enum CodingKeys: String, CodingKey {
        case name, image, size, length, price, extraInfo, color, favorite
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(image, forKey: .image)
        try container.encode(size, forKey: .size)
        try container.encode(length, forKey: .length)
        try container.encode(price, forKey: .price)
        try container.encode(extraInfo, forKey: .extraInfo)
        
        let colorComponents = color.components()
        try container.encode(colorComponents, forKey: .color)

        try container.encode(favorite, forKey: .favorite)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        image = try container.decode(CodableImage.self, forKey: .image)
        size = try container.decode(String.self, forKey: .size)
        length = try container.decode(String.self, forKey: .length)
        price = try container.decode(String.self, forKey: .price)
        extraInfo = try container.decode(String.self, forKey: .extraInfo)

        let colorComponents = try container.decode([CGFloat].self, forKey: .color)
        color = Color.fromComponents(components: colorComponents)

        favorite = try container.decode(Bool.self, forKey: .favorite)
    }
}

extension Color {
    func components() -> [CGFloat] {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return [red, green, blue, alpha]
    }

    static func fromComponents(components: [CGFloat]) -> Color {
        return Color(.sRGB, red: components[0], green: components[1], blue: components[2], opacity: components[3])
    }
}



struct ClothingInfo: View {
    @EnvironmentObject var collection: Collection
    @Environment(\.dismiss) var dismiss
    var clothingItem: ClothingItem
    let sizes = ["XS", "Small", "Medium", "Large", "XL"]
    let lengthsTops = ["Short Sleeve", "Long Sleeve", "Sleeveless", "Tube top", "Crop Top"]
    let lengthsBottoms = ["Shorts", "Jeans", "Pants", "Short skirt", "Midi Skirt", "Long Skirt"]
    let types = ["Dress", "Coat", "Sweater", "Jacket", "Shoes", "Accessories", "Other"]
    var name: String
    var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    @State var size: String
    @State var length: String
    @State var price: String
    @State var extraInfo: String
    @State var color: Color
    @State var favorite: Bool
    var body: some View {
        NavigationStack {
            Form {
                Image(uiImage: UIImage(data: clothingItem.image.photo)!)
                    .resizable()
                    .frame(width: 200, height: 230,alignment: .center) //center
                    .scaledToFit()
                Section {
                    Picker("Size", selection: $size) {
                        ForEach(sizes, id: \.self) {
                            Text($0)
                        }
                    }
                    if(name == "Tops" || name == "Bottoms"){
                        Picker("Length", selection: $length) {
                            if(name == "Tops") {
                                ForEach(lengthsTops, id: \.self) {
                                    Text($0)
                                }
                            }
                            else if (name == "Bottoms"){
                                ForEach(lengthsBottoms, id: \.self) {
                                    Text($0)
                                }
                            }
                        }
                    }
                    else {
                        Picker("Type",selection: $extraInfo) {
                            ForEach(types, id: \.self) {
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
                    ColorPicker("Color", selection: $color)
                    LabeledContent {
                        Button(action: {
                            favorite.toggle()
                            if favorite {
                                if !collection.favorites.contains(where: { $0.name == clothingItem.name }) {
                                    collection.favorites.append(clothingItem)
                                }
                            } else {
                                if let index = collection.favorites.firstIndex(where: { $0.name == clothingItem.name }) {
                                    collection.favorites.remove(at: index)
                                }
                            }
                        }) {
                            if(favorite == false) {
                                Image(systemName: "heart").foregroundColor(buttonColor)
                            }
                            else {
                                Image(systemName: "heart.fill").foregroundColor(buttonColor)
                            }
                        }
                    } label: {
                        Text("Favorite")
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
