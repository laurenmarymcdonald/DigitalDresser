//
//  Collection.swift
//  FitFinder
//
//  Created by Lauren McDonald on 9/30/24.
//

import SwiftUI
import PhotosUI
class Collection: ObservableObject {
    @EnvironmentObject var collection: Collection
    @Published var topItems = [ClothingItem]()
    @Published var bottomItems = [ClothingItem]()
    @Published var otherItems = [ClothingItem]()
    @Published var outfits = [OutfitItem]()//an array of oufits that hold a top and bottom
    func deleteImage(at index: Int, from array: Binding<[ClothingItem]>) {
            if index >= 0 && index < array.wrappedValue.count {
                array.wrappedValue.remove(at: index)
            }
        }
    func deleteOutfit(at index: Int, from array: Binding<[OutfitItem]>) {
        if index >= 0 && index < array.wrappedValue.count {
            array.wrappedValue.remove(at: index)
        }
    }
    
}

