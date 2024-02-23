//
//  MainView.swift
//  SwiftUI-Africa-IOS17
//
//  Created by Daniel Felipe on 18/02/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {

            ContentView()
                .tabItem { Label("Browse", systemImage: "square.grid.2x2") }

            VideoListView()
                .tabItem { Label("Watch", systemImage: "play.rectangle") }

            MapView()
                .tabItem { Label("Locations", systemImage: "map") }

            GalleryView()
                .tabItem { Label("Gallery", systemImage: "photo") }
//                .tabItem {
//                    Image(systemName: "photo")
//                    Text("Gallery")
//                }
        }//: TabView
    }
}

#Preview { MainView() }
