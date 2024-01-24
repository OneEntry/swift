//
//  GreetingsView.swift
//  OneEntry Sdk Sample
//
//  Created by Артур Данилов on 09.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI

struct PlanetsBackgroundView: View {
    var body: some View {
        GeometryReader { geometry in
            
            let size = geometry.size
            
            ZStack {
                LinearGradient.background.ignoresSafeArea()
                
                Image("planet.orange")
                    .offset(x: size.width / 3, y: -size.height / 3)
                
                Image("stars")
                    .foregroundStyle(.white)
                    .offset(y: -170)
                    .rotationEffect(.degrees(-15))
                
                Image("planet.pink")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: size.width / 2)
                    .offset(x: -size.width / 2.5, y: -size.height / 8)
                
                Image("stars")
                    .foregroundStyle(.white)
                
                Image("stars")
                    .foregroundStyle(.white)
                    .offset(y: 150)
                    .rotationEffect(.degrees(15))
                    .scaleEffect(1.2)
                
                Image("planet.orange")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x: size.width / 3, y: size.height / 3)
            }
        }
    }
}

#Preview {
    PlanetsBackgroundView()
}
