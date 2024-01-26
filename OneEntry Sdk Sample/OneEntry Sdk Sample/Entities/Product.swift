//
//  Product.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 24.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import Foundation
import OneEntry

struct Product: ProductProtocol {
    let id: UUID = .init()
    
    let productID: Int
    let title: String
    let image: String
    let price: Double
    let currencyIcon: String
    let sticker: Sticker?
}

extension OneEntryProduct {
    var asProduct: Product? {
        guard
            let title = localizeInfo(languageCode: "en_US")?.title,
            let image = localizeAttribute("image", languageCode: "en_US")?.imageValues?.first?.downloadLink,
            let price = localizeAttribute("price", languageCode: "en_US")?.doubleValue,
            let currencyIcon = localizeAttribute("currency_icon", languageCode: "en_US")?.stringValue
        else { return nil }
        
        return .init(
            productID: id,
            title: title,
            image: image,
            price: price,
            currencyIcon: currencyIcon,
            sticker: .init(rawValue: templateIdentifier ?? "")
        )
    }
}

extension Product {
    static let preview: Self = .init(
        productID: 0,
        title: "All Ninja",
        image: "https://sdk-sample.oneentry.cloud/cloud-static/files/project/page/27/image/товар-34.png",
        price: 12,
        currencyIcon: "$",
        sticker: .bestSeller
    )
}
