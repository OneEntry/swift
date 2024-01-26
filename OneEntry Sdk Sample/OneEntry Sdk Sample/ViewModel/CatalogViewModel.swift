//
//  CatalogViewModel.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 24.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import Foundation
import OneEntry
import SwiftyBeaver

@MainActor
final class CatalogViewModel: ObservableObject {
    @Published private(set) var categories: [Category<Product>] = []
    @Published private(set) var fetchingStatus: FetchingStatus = .loading        
    
    @Sendable
    func fetch() async {
        fetchingStatus = .loading
        
        do {
            let menu = try await OneEntryProject.shared.menu(with: "catalog")                        
            
            guard let root = menu.pages.first(where: { $0.pageUrl == "catalog_content" }) else { throw "Catalog content page not found" }
            
            self.categories = root.children?.compactMap({ $0.category() }) ?? []
            
            await fetchProducts()
            
            fetchingStatus = .success
            
        } catch {
            SwiftyBeaver.error(error)
            
            fetchingStatus = .failure
        }
    }
    
    private func fetchProducts() async {
        await withTaskGroup(of: Void.self) { group in
            for i in categories.indices {
                group.addTask {
                    
                    let productsHelper: OneEntryProducts = .shared
                    let id = await self.categories[i].categoryID
                    
                    guard let result = try? await productsHelper.products(page: id, langCode: "en_US") else { return }
                    
                    DispatchQueue.main.async {
                        self.categories[i].children = result.items.compactMap(\.asProduct)
                    }
                }
            }
        }
    }
}
