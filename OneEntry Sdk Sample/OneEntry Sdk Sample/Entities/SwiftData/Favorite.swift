//
//  Favorite.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 26.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import Foundation
import SwiftData

@Model
final class Favorite: ProductProtocol {
    @Attribute(.unique) var id: UUID
    
    var productID: Int
    var title: String
    var image: String
    var price: Double
    var currencyIcon: String
    var stickerValue: String?
    
    init(from product: any ProductProtocol) {
        self.id = product.id
        self.productID = product.productID
        self.title = product.title
        self.image = product.image
        self.price = product.price
        self.currencyIcon = product.currencyIcon
        self.stickerValue = product.sticker?.rawValue
    }
    
    var sticker: Sticker? {
        let value = stickerValue ?? ""
        
        return .init(rawValue: value)
    }
}
