//
//  FitFinderApp.swift
//  FitFinder
//
//  Created by Lauren McDonald on 9/26/24.
//

import SwiftUI

@main
struct FitFinderApp: App {
    @StateObject private var closetImages = Collection()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(closetImages)
        }
    }
}
