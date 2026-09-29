# Digital Dresser

An iOS app for cataloging your wardrobe and building outfits. Built with Swift and SwiftUI and published on the App Store.

<!-- Add 2–3 phone screenshots here, e.g.: -->
<!-- <img src="screenshots/closet.png" width="250"> <img src="screenshots/outfit.png" width="250"> -->

## Features
- **Closet:** add clothing photos from your camera roll and sort them into Tops, Bottoms, Shoes, and Other
- **Item details:** tag each item with size, fit or length, price, color, and notes, and mark favorites
- **Outfit creator:** swipe or tap through tops and bottoms to pair them, then save the outfit (duplicate outfits are detected)
- **Outfit log:** record the occasion, the date, and how often you've worn each outfit
- **Favorites:** a tab that collects every item you've favorited

## How it works
- `Collection` is a shared `ObservableObject` that every screen reads through `@EnvironmentObject`.
- `ClothingItem` and `OutfitItem` have custom `Codable` implementations. Photos are stored as image data, and SwiftUI `Color` values are saved as RGBA components.
- The whole closet is saved as JSON in the app's Documents folder when the app goes to the background, and it's loaded again at launch.

## Running it
1. Open the project in Xcode 15 or later.
2. Run it on an iPhone simulator or device with iOS 17 or later.

## What I'd improve next
- Store images as separate files, or move to SwiftData, so large closets load faster.
- Support outfits with more pieces than a top and a bottom (shoes, accessories).
