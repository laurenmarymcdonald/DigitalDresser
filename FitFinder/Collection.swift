//
//  Collection.swift
//  FitFinder
//
//  Created by Lauren McDonald on 9/30/24.
//

import SwiftUI
import PhotosUI
import Foundation
class Collection: ObservableObject, Codable {
    @Published var topItems = [ClothingItem]()
    @Published var bottomItems = [ClothingItem]()
    @Published var otherItems = [ClothingItem]()
    @Published var favorites = [ClothingItem]()
    @Published var outfits = [OutfitItem]()
    
    enum CodingKeys: CodingKey {
        case topItems, bottomItems, otherItems, favorites, outfits
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        topItems = try container.decode([ClothingItem].self, forKey: .topItems)
        bottomItems = try container.decode([ClothingItem].self, forKey: .bottomItems)
        otherItems = try container.decode([ClothingItem].self, forKey: .otherItems)
        favorites = try container.decode([ClothingItem].self, forKey: .favorites)
        outfits = try container.decode([OutfitItem].self, forKey: .outfits)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(topItems, forKey: .topItems)
        try container.encode(bottomItems, forKey: .bottomItems)
        try container.encode(otherItems, forKey: .otherItems)
        try container.encode(favorites, forKey: .favorites)
        try container.encode(outfits, forKey: .outfits)
    }
    
    init() {
        loadData()
    }
    
    public func loadData() {
        let path = URL.documentsDirectory.appending(component: "collection")
        guard let data = try? Data(contentsOf: path) else {
            print("Could not read data from path")
            return
        }
        
        do {
            let decodedData = try JSONDecoder().decode(Collection.self, from: data)
            self.topItems = decodedData.topItems
            self.bottomItems = decodedData.bottomItems
            self.otherItems = decodedData.otherItems
            self.favorites = decodedData.favorites
            self.outfits = decodedData.outfits
        } catch {
            print("Could not decode data: \(error)")
        }
    }
    
    public func saveData() {
        let path = URL.documentsDirectory.appending(component: "collection")
        do {
            let data = try JSONEncoder().encode(self)
            try data.write(to: path)
        } catch {
            print("Could not save data: \(error)")
        }
    }
    
    func deleteImage(at index: Int, from arrayType: String) {
        switch arrayType {
        case "Tops":
            if index >= 0 && index < topItems.count { topItems.remove(at: index) }
        case "Bottoms":
            if index >= 0 && index < bottomItems.count { bottomItems.remove(at: index) }
        case "Other":
            if index >= 0 && index < otherItems.count { otherItems.remove(at: index) }
        case "Favorite":
            if index >= 0 && index < favorites.count { favorites.remove(at: index) }
        case "Outfits":
            if index >= 0 && index < outfits.count { outfits.remove(at: index) }
        default:
            break
        }
        saveData()
    }
    func addItem(_ item: ClothingItem, to arrayType: String) {
            switch arrayType {
            case "Tops":
                topItems.append(item)
            case "Bottoms":
                bottomItems.append(item)
            case "Other":
                otherItems.append(item)
            case "Favorites":
                favorites.append(item)
            default:
                break
            }
            saveData()
    }
    func updateItem(_ item: ClothingItem) {
        if let index = topItems.firstIndex(where: { $0.id == item.id }) {
            topItems[index] = item
        } else if let index = bottomItems.firstIndex(where: { $0.id == item.id }) {
            bottomItems[index] = item
        } else if let index = otherItems.firstIndex(where: { $0.id == item.id }) {
            otherItems[index] = item
        }
        saveData()
    }

        
}

