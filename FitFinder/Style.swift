//
//  Style.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/7/24.
//

import SwiftUI

struct Style: View {
    @EnvironmentObject var closetImages: Collection
    @State private var imgIndexTops: Int = 0
    @State private var imgIndexBottoms: Int = 0
    var body: some View {
        VStack{
            if($closetImages.topItems.isEmpty && $closetImages.bottomItems.isEmpty) {
                Text("No Items in Closet")
                    .font(.custom("Georgia", size: 30))
                    .padding()
            }
            else {
                Button("Save Outfit") {
                    OutfitItem(clothingItemTop: closetImages.topItems[imgIndexTops],clothingItemBottom: closetImages.bottomItems[imgIndexBottoms])
                }
                if($closetImages.topItems.isEmpty) {
                    Text("No Top Items in Closet")
                        .font(.custom("Georgia", size: 30))
                        .padding()
                }
                else {
                    ItemImageView(clothingItem: closetImages.topItems[imgIndexTops], index: imgIndexTops, title: "Tops",array: $closetImages.topItems)
                        .onTapGesture {
                            if(imgIndexTops < closetImages.topItems.count-1) {
                                imgIndexTops+=1
                            }
                            else {
                                imgIndexTops = 0
                            }
                        }
                }
                Spacer()
                if($closetImages.bottomItems.isEmpty) {
                    Text("No Bottom Items in Closet")
                        .font(.custom("Georgia", size: 30))
                        .padding()
                }
                else{
                    ItemImageView(clothingItem: closetImages.bottomItems[imgIndexBottoms], index: imgIndexBottoms, title: "Tops",array: $closetImages.bottomItems)
                        .onTapGesture {
                            if(imgIndexBottoms < closetImages.bottomItems.count-1) {
                                imgIndexBottoms+=1
                            }
                            else {
                                imgIndexBottoms = 0
                            }
                        }
                }
            }
        }
        /*.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    Color.teal.opacity(0.3)
                        .ignoresSafeArea()
        }*/ // changes color of background, only works for this view
    }
}
