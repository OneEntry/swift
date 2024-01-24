//
//  Banner.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 22.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import Foundation
import OneEntry

struct Banner: Identifiable, Equatable {
    let id: Int
    let image: String
}

extension OneEntryProduct {
    var asBanner: Banner? {
        guard let image = localizeAttribute("image", languageCode: "en_US")?.imageValues?.first?.downloadLink
        else { return nil }
        
        return .init(id: id, image: image)
    }
}

extension Banner {
    static let preview = Banner(id: 0,
                                image: "https://sdk-sample.oneentry.cloud/cloud-static/files/project/page/8/image/4-BANNER.png")
}
