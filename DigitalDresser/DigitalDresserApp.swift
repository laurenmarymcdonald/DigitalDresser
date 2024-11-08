//
//  FitFinderApp.swift
//  FitFinder
//
//  Created by Lauren McDonald on 9/26/24.
//

import SwiftUI


@main
struct DigitalDresser: App {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject var collection = Collection()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(collection)
                .onAppear {
                    collection.loadData()
                }
                .onChange(of: scenePhase) {
                    if scenePhase == .background {
                        collection.saveData()
                    }
                }
        }
    }
}
 

