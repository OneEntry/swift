//
//  transitionScrolling.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 22.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI

extension View {
    @ViewBuilder
    func transitionScrolling() -> some View {
        self
            .scrollTransition { content, phase in
                content
                    .opacity(phase.isIdentity ? 1 : 0)
                    .scaleEffect(phase.isIdentity ? 1 : 0.9)
                    .blur(radius: phase.isIdentity ? 0 : 10)
            }
    }
}
