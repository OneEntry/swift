//
//  Category.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 22.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import Foundation
import OneEntry

struct Category: Identifiable, Equatable {
    let id: Int
    let title: String
}

extension OneEntryMenuPage {
    var asCategory: Category? {
        guard let title = localizeInfo(languageCode: "en_US")?.title else { return nil }
        
        return .init(id: id, title: title)
    }
}
