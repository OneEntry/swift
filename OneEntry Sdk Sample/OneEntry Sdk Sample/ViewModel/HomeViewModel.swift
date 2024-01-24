//
//  HomeViewModel.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 19.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import Foundation
import OneEntry
import SwiftyBeaver

@MainActor
final class HomeViewModel: ObservableObject {    
    @Published private(set) var recent: [RecentProduct] = []
    @Published private(set) var categories: [Category] = []
    @Published private(set) var fetchingStatus: FetchingStatus = .loading
    
    @Published private var banners: [Int : [Banner]] = [:]
    
    private let menuHelper: OneEntryProject = .shared
    private let productsHelper: OneEntryProducts = .shared        
    
    @Sendable
    func fetch() async {
        do {
            let menu = try await menuHelper.menu(with: "home")
            
            guard let categories = menu.pages.first(where: { $0.pageUrl == "home_content" })?.children else { throw "Home content not found" }
                    
            self.categories = categories.compactMap(\.asCategory)
            await self.fillCategoriesProducts()
            
            self.recent = try await productsHelper
                .products(page: "home_recent", langCode: "en_US")
                .items
                .compactMap(\.asRecent)
            
            self.fetchingStatus = .success
        } catch {
            SwiftyBeaver.error(error)
            
            self.fetchingStatus = .failure
        }
    }
    
    func banner(for page: Category) -> [Banner]? {
        return banners[page.id]
    }
    
    private func fillCategoriesProducts() async {
        await withTaskGroup(of: Void.self) { group in
            for page in categories {
                let products = try? await productsHelper.products(page: page.id, langCode: "en_US")
                
                DispatchQueue.main.async {
                    self.banners[page.id] = products?.items.compactMap(\.asBanner)
                }
            }
        }
    }
}
