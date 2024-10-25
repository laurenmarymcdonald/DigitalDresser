//
//  MainView.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/3/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var collection: Collection
    private var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("", systemImage: "house")
            }
            ClosetMenu()
                .tabItem {
                    Label("", systemImage: "hanger")
            }
            StyleMenu()
                .tabItem {
                    Label("", systemImage: "tshirt")
                }
            FavoritesCloset()
                .tabItem{
                    Label("", systemImage: "heart.fill")
                }
        }
    }
}

