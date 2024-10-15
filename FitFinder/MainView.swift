//
//  MainView.swift
//  FitFinder
//
//  Created by Lauren McDonald on 10/3/24.
//

import SwiftUI

struct MainView: View {
    private var buttonColor = Color(red: 187/255, green: 145/255, blue: 250/255)
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("", systemImage: "house")
                        .font(.custom("Georgia", size: 30))
            }
            ClosetMenu()
                .tabItem {
                    Label("", systemImage: "hanger")
                        .font(.custom("Georgia", size: 30))
            }
            StyleMenu()
                .tabItem {
                    Label("", systemImage: "tshirt")
                        .font(.custom("Georgia", size: 30))
                }
        }
    }
}

