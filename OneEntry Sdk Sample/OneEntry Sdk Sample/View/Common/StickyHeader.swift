//
//  StickyHeader.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 24.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI
import HMStickyHeader

struct CustomStickyHeader<T: Equatable>: View {
    var body: some View {
        StickyHeader<Category<T>> { item, isActive in
            Text(item.title)
                .font(.subheadline)
                .foregroundStyle(isActive ? Color.primary.opacity(0.5) : Color.gray)
                .padding(8)
                .background {
                    Capsule()
                        .fill(.gray.opacity(isActive ? 0.4 : 0))
                        .stroke(.gray.opacity(isActive ? 0 : 0.4), style: .init(lineWidth: 2))
                }
                .clipShape(Capsule())
        }
        .headerBackground(.thinMaterial)
    }
}

#Preview {
    ContentView()
}
