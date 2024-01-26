//
//  Category.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 22.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import Foundation
import OneEntry

struct Category<T: Equatable>: Identifiable, Equatable {
    var id: UUID = .init()
    
    var categoryID: Int
    var title: String
    var children: [T] = []
}

extension OneEntryMenuPage {
    
    func category<T: Equatable>(langCode: String = "en_US") -> Category<T>? {
        guard let title = localizeInfo(languageCode: "en_US")?.title else { return nil }
        
        return .init(categoryID: id, title: title)
    }
}
