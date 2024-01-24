//
//  HomeView.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 12.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI
import HMStickyHeader

struct HomeView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    RecentProductsView()
                    
                    HomeContent()
                }
            }
            .sticky(items: homeViewModel.categories)
            .navigationTitle("Welcome")
        }
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
                    ForEach(homeViewModel.banner(for: category) ?? []) { banner in
                        BannerView(banner: banner)
                    }
                }
                .stickyItem(category)
            }
        }
        .padding()
        .safeAreaInset(edge: .top) {
            StickyHeader<Category> { item, isActive in
                
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
        }
    }
}

#Preview {
    ContentView()
}
