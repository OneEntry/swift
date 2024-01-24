//
//  Stickers.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 20.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import Foundation
import SwiftUI

enum Sticker: String {
    case newArrivals = "new_arrival"
    case bestSeller = "best_seller"
    case promotion = "promotion"
    case offer = "offer"
        
    var image: Image {
        switch self {
            case .newArrivals: return .init("new.circle.red")
            case .bestSeller: return .init("star.circle.orange")
            case .promotion: return .init("sale.circle.black")
            case .offer: return .init("sale.circle.yellow")
        }
    }
}
