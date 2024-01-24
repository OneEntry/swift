//
//  BadgeColorViewModifier.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 11.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI

extension View {
    @ViewBuilder
    func badgeColor(_ color: Color) -> some View {
        self
            .modifier(BadgeColorViewModifier(color: .init(color)))
    }
}

struct BadgeColorViewModifier: ViewModifier {
    
    init(color: UIColor) {
        UITabBarItem.appearance().badgeColor = color
    }
    
    func body(content: Content) -> some View {
        content
    }
}

#Preview {
    TabView {
        Text("Tab")
            .tabItem { Label("Tab", systemImage: "globe") }
            .badge(10)
            .badgeColor(.accent)
    }
}
