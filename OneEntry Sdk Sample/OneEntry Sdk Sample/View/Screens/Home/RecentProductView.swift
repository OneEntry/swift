//
//  RecentProductView.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 20.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import OneEntry

struct RecentProductView: View {
    
    let product: RecentProduct
    
    var body: some View {
        
        WebImage(url: URL(string: product.image))
            .resizable()
            .placeholder {
                Rectangle()
                    .fill(.gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 185, maxHeight: 260)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(alignment: .bottom) {
                Text(product.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
            }
            .overlay(alignment: .topLeading) {
                product.sticker?.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 40, maxHeight: 40)
                    .padding()
            }
    }
}

#Preview("Product View", traits: .sizeThatFitsLayout) {
    RecentProductView(product: .preview)
}
