//
//  ProductView.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 24.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftData

struct ProductView: View {
    let product: any ProductProtocol
    
    @Query var favorites: [Favorite]
    @Environment(\.modelContext) private var context
    
    var model: Favorite? {
        favorites.first(where: { $0.productID == product.productID })
    }
    
    var isFavorite: Bool { model != nil }
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: product.image))
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Text(product.title)
            
            Text("\(product.currencyIcon) \(product.price, specifier: "%.0f")")
                .fontWeight(.medium)
            
            Text("ADD TO CART")
                .font(.footnote)
                .frame(maxWidth: .infinity)
                .padding(5)
                .clipShape(Capsule())
                .background(
                    Capsule()
                        .stroke(.accent, style: .init(lineWidth: 1))
                )
                .foregroundStyle(.accent)
        }
        .padding()
        .aspectRatio(1/1.5, contentMode: .fit)
        .frame(maxHeight: 270)
        .background(.ultraThickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(alignment: .topLeading) {
            product.sticker?.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 30, maxHeight: 30)
                .padding()
        }
        .overlay(alignment: .topTrailing) {
            Button(action: toggleFavorites) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 20, maxHeight: 20)
                    .padding()
            }
            .contentTransition(.symbolEffect(.replace))
        }
    }
    
    private func toggleFavorites() {
        withAnimation {
            if isFavorite {
                context.delete(model!)
            } else {
                let entity = Favorite(from: product)
                context.insert(entity)
            }
        }
    }
}

#Preview("Product", traits: .sizeThatFitsLayout) {
    ProductView(product: Product.preview)
}
