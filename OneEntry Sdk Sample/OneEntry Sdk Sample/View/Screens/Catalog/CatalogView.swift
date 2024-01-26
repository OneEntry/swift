//
//  CatalogView.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 24.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI
import HMStickyHeader

struct CatalogView: View {
    
    private let columns: [GridItem] = .init(repeating: .init(.flexible()), count: 2)
    
    @EnvironmentObject var catalogModel: CatalogViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                CategoriesView()
            }
            .padding()
            .safeAreaInset(edge: .top) {
                CustomStickyHeader<Product>()
            }
        }
        .sticky(items: catalogModel.categories)
        .navigationTitle("Catalog")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "square.3.layers.3d.top.filled")
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "line.3.horizontal.decrease.circle.fill")
            }
        }
    }
    
    @ViewBuilder
    private func CategoriesView() -> some View {
        ForEach(catalogModel.categories) { category in
            Section {
                ForEach(category.children) { product in
                    ProductView(product: product)
                        .transitionScrolling()
                }
            } header: {
                Text(category.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .stickyItem(category)
            }
        }
    }
}

#Preview {
    ContentView()
}
