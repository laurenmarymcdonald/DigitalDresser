//
//  Style.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/7/24.
//

import SwiftUI

struct Style: View {
    var isCreatingOutfit: Bool
    var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    @EnvironmentObject var collection: Collection
    @State var imgIndexTops: Int = 0
    @State var imgIndexBottoms: Int = 0
    
    var body: some View {
        VStack{
            if $collection.topItems.isEmpty && $collection.bottomItems.isEmpty {
                Text("Add Tops and Bottoms to Closet")
                    .font(.custom("Georgia", size: 30))
                    .padding()
            }
            else {
                if isCreatingOutfit {
                    Button("Save Outfit") {
                        let newItem = OutfitItem(
                            clothingItemTop: collection.topItems[imgIndexTops],
                            clothingItemBottom: collection.bottomItems[imgIndexBottoms],
                            occasion: "Type Occasion",
                            date: "1/1/2024",
                            worn: false
                        )
                        collection.outfits.append(newItem)
                    }
                    .font(.custom("Georgia", size: 30))
                    .buttonStyle(.borderedProminent)
                    .tint(buttonColor)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                }
                
                if $collection.topItems.isEmpty {
                    Text("No Top Items in Closet")
                        .font(.custom("Georgia", size: 30))
                        .padding()
                } else {
                    ItemImageView(clothingItem: collection.topItems[imgIndexTops], index: imgIndexTops, title: "Tops", array: collection.topItems)
                        .onTapGesture {
                            if imgIndexTops < collection.topItems.count - 1 {
                                imgIndexTops += 1
                            } else {
                                imgIndexTops = 0
                            }
                        }
                }
                
                Spacer()
                
                if $collection.bottomItems.isEmpty {
                    Text("No Bottom Items in Closet")
                        .font(.custom("Georgia", size: 30))
                        .padding()
                } else {
                    ItemImageView(clothingItem: collection.bottomItems[imgIndexBottoms], index: imgIndexBottoms, title: "Bottoms", array: collection.bottomItems)
                        .onTapGesture {
                            if imgIndexBottoms < collection.bottomItems.count - 1 {
                                imgIndexBottoms += 1
                            } else {
                                imgIndexBottoms = 0
                            }
                        }
                }
            }
        }
    }
}
