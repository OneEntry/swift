//
//  HomeView.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 12.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                RecentProductsView()
                
                HomeContent()
            }
        }
        .sticky(items: homeViewModel.categories)
        .navigationTitle("Welcome")
    }
    
    @ViewBuilder
    private func RecentProductsView() -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(homeViewModel.recent) { product in
                    RecentProductView(product: product) 
                        .transitionScrolling()
                }
            }
            .padding()
        }
        .scrollIndicators(.never)
    }
    
    @ViewBuilder
    private func HomeContent() -> some View {
        VStack {
            ForEach(homeViewModel.categories) { category in
                VStack {
                    ForEach(category.children) { banner in
                        BannerView(banner: banner)
                    }
                }
                .stickyItem(category)
            }
        }
        .padding()
        .safeAreaInset(edge: .top) {
            CustomStickyHeader<Banner>()
        }
    }
}

#Preview {
    ContentView()
}
