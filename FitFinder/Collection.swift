//
//  ClosetImages.swift
//  FitFinder
//
//  Created by Lauren McDonald on 9/30/24.
//

import SwiftUI
import PhotosUI
class Collection: ObservableObject {
    @EnvironmentObject var closetImages: Collection
    @Published var topItems = [ClothingItem]()
    @Published var bottomItems = [ClothingItem]()
    @Published var outfitItems = [[ClothingItem](),[ClothingItem]()]//an array of topitems and bottm items
    func deleteImage(at index: Int, from array: Binding<[ClothingItem]>) {
            if index >= 0 && index < array.wrappedValue.count {
                array.wrappedValue.remove(at: index)
            }
        }
}

