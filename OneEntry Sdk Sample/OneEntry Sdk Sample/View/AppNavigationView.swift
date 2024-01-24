//
//  AppNavigationVie.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 20.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI

struct AppNavigationView: View {
    
    @ObservedObject var appViewModel = AppViewModel()
    
    var body: some View {
        TabView(selection: $appViewModel.activeScreen) {
            HomeView()
                .tag(AppViewModel.AppScreen.home)
                .tabItem { Label("Home", systemImage: "house") }
            
            Text("Catalog")
                .tag(AppViewModel.AppScreen.catalog)
                .tabItem { Label("Catalog", systemImage: "square.grid.2x2") }
            
            Text("Favorite")
                .tag(AppViewModel.AppScreen.favorites)
                .tabItem { Label("Favorite", systemImage: "heart") }
            
            Text("My orders")
                .tag(AppViewModel.AppScreen.orders)
                .tabItem { Label("My orders", systemImage: "basket") }
                .badge(10)
                .badgeColor(.accent)
            
            SettingsView()
                .tag(AppViewModel.AppScreen.settings)
                .tabItem { Label("Settings", systemImage: "person.circle") }
        }
        .environmentObject(appViewModel)
    }
}

#Preview {
    ContentView()
}
