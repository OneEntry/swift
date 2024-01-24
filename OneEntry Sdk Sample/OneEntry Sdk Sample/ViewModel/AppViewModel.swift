//
//  AppViewModel.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 12.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import Foundation

final class AppViewModel: ObservableObject {
    @Published var activeScreen: AppScreen = .home
    
    // MARK: - Screen that can be accessed using the TabView
    enum AppScreen {
        case home, catalog, settings, favorites, orders
    }
}
