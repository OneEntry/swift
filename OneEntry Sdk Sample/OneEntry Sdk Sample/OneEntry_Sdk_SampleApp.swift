//
//  OneEntry_Sdk_SampleApp.swift
//  OneEntry Sdk Sample
//
//  Created by Артур Данилов on 09.01.2024.
//

import SwiftUI
import SwiftData

@main
struct OneEntry_Sdk_SampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            GreetingsView()
                .modelContainer(
                    for: [
                        Favorite.self
                    ]
                )
        }
    }
}
