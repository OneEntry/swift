//
//  RecentProduct.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 20.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import Foundation
import OneEntry

struct RecentProduct: Identifiable, Equatable {
    let id: Int
    let title: String
    let image: String
    let sticker: Sticker?
}

extension OneEntryProduct {
    var asRecent: RecentProduct? {
        guard let image = localizeAttribute("image", languageCode: "en_US")?.imageValues?.first?.downloadLink,
              let title = localizeInfo(languageCode: "en_US")?.title
        else { return nil }
        
        return .init(id: id, title: title, image: image, sticker: .init(rawValue: templateIdentifier ?? ""))
    }
}

// MARK: - Preview
extension RecentProduct {
    static let preview = RecentProduct(id: 0,
                                       title: "BEST SELLER",
                                       image: "https://sdk-sample.oneentry.cloud/cloud-static/files/project/page/2/image/3-BANNER.png",
                                       sticker: .bestSeller)
}

