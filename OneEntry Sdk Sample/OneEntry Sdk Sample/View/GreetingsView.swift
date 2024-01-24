//
//  GreetingsView.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 09.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI

struct GreetingsView: View {
    
    @AppStorage("greeting") var greeting = true
    
    var body: some View {
        ZStack {
            if greeting {
                ZStack(alignment: .bottom) {
                    PlanetsBackgroundView()
                    
                    Button("Get started") {
                        greeting = false
                    }
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                    .padding()
                }
                .transition(.blurReplace)
            } else {
                ContentView()
            }
        }
        .animation(.default, value: greeting)
    }
}

#Preview {
    GreetingsView()
}
