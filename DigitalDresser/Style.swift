//
//  Style.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/7/24.
//
import SwiftUI

struct Style: View {
    var isCreatingOutfit: Bool
    var buttonColor = Color(red: 205/255, green: 175/255, blue: 250/255)
    @EnvironmentObject var collection: Collection
    @State var imgIndexTops: Int = 0
    @State var imgIndexBottoms: Int = 0
    @State private var showConfirmation = false
    @State private var showDuplicateAlert = false

    var body: some View {
        VStack {
            if collection.topItems.isEmpty && collection.bottomItems.isEmpty {
                Text("Add Tops and Bottoms to Closet")
                    .font(.custom("Georgia", size: 30))
                    .padding()
            } else {
                if isCreatingOutfit &&  !collection.topItems.isEmpty && !collection.bottomItems.isEmpty {
                    Button("Save Outfit") {
                        let newItem = OutfitItem(
                            id: UUID(),
                            clothingItemTop: collection.topItems[imgIndexTops],
                            clothingItemBottom: collection.bottomItems[imgIndexBottoms],
                            occasion: "Type Occasion",
                            date: "1/1/2024",
                            worn: "Never"
                        )
                        
                        if !isOutfitDuplicate(newItem) {
                            collection.outfits.append(newItem)
                            
                            withAnimation {
                                showConfirmation = true
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    showConfirmation = false
                                }
                            }
                        } else {
                            showDuplicateAlert = true
                        }
                    }
                    .font(.custom("Georgia", size: 30))
                    .buttonStyle(.borderedProminent)
                    .tint(buttonColor)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                }
                
                if showConfirmation {
                    Text("Outfit Saved!")
                        .font(.custom("Georgia", size: 25))
                        .foregroundColor(buttonColor)
                        .padding()
                        .transition(.opacity)
                }

                GeometryReader { geometry in
                    VStack(spacing: 0) {
                        // Top Image View
                        if collection.topItems.isEmpty {
                            Text("No Top Items in Closet")
                                .font(.custom("Georgia", size: 30))
                                .padding()
                        } else {
                            ItemImageView(
                                clothingItem: collection.topItems[imgIndexTops],
                                index: imgIndexTops,
                                title: "Tops",
                                array: collection.topItems,
                                notStyleView: true
                            )
                            .gesture(
                                DragGesture()
                                    .onEnded { value in
                                        handleSwipe(for: &imgIndexTops, items: collection.topItems, value: value)
                                    }
                            )
                            .onTapGesture {
                                handleTap(for: &imgIndexTops, items: collection.topItems)
                            }
                        }

                        Spacer()

                        // Bottom Image View
                        if collection.bottomItems.isEmpty {
                            Text("No Bottom Items in Closet")
                                .font(.custom("Georgia", size: 30))
                                .padding()
                        } else {
                            ItemImageView(
                                clothingItem: collection.bottomItems[imgIndexBottoms],
                                index: imgIndexBottoms,
                                title: "Bottoms",
                                array: collection.bottomItems,
                                notStyleView: true
                            )
                            .gesture(
                                DragGesture()
                                    .onEnded { value in
                                        handleSwipe(for: &imgIndexBottoms, items: collection.bottomItems, value: value)
                                    }
                            )
                            .onTapGesture {
                                handleTap(for: &imgIndexBottoms, items: collection.bottomItems)
                            }
                        }
                        Spacer()
                        Text("Tap or swipe to navigate between images")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                    .padding()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
        
        .alert(isPresented: $showDuplicateAlert) {
            Alert(title: Text("Duplicate Outfit"), message: Text("You have already created this outfit!"), dismissButton: .default(Text("OK")))
        }
    }

    private func handleSwipe(for index: inout Int, items: [ClothingItem], value: DragGesture.Value) {
        let horizontalTranslation = value.translation.width

        if horizontalTranslation > 0 {
            index = index < items.count - 1 ? index + 1 : 0
        } else if horizontalTranslation < 0 {
            index = index > 0 ? index - 1 : items.count - 1
        }
    }

    private func handleTap(for index: inout Int, items: [ClothingItem]) {
        index = index < items.count - 1 ? index + 1 : 0
    }
    private func isOutfitDuplicate(_ newItem: OutfitItem) -> Bool {
        return collection.outfits.contains { existingOutfit in
            existingOutfit.clothingItemTop.id == newItem.clothingItemTop.id &&
            existingOutfit.clothingItemBottom.id == newItem.clothingItemBottom.id
        }
    }
}
