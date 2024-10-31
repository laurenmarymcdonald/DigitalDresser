//
//  ClothingItem.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/29/24.
//

import SwiftUI
struct ClothingItem: Codable,Equatable {
    var id = UUID()
    var name: String
    var image: CodableImage
    var size: String
    var length: String
    var price: String
    var extraInfo: String
    var type: String
    var color: Color
    var favorite: Bool
    init(name: String, image: CodableImage, size: String, length: String, price: String, extraInfo: String, type: String, color: Color, favorite: Bool) {
            self.name = name
            self.image = image
            self.size = size
            self.length = length
            self.price = price
            self.extraInfo = extraInfo
            self.type = type
            self.color = color
            self.favorite = favorite
        }
    enum CodingKeys: String, CodingKey {
        case name, image, size, length, price, extraInfo, type, color, favorite
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(image, forKey: .image)
        try container.encode(size, forKey: .size)
        try container.encode(length, forKey: .length)
        try container.encode(price, forKey: .price)
        try container.encode(extraInfo, forKey: .extraInfo)
        try container.encode(type, forKey: .type)
        
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
        type = try container.decode(String.self, forKey: .type)

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
