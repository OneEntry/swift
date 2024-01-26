//
//  ProductProtocol.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 26.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import Foundation

protocol ProductProtocol: Identifiable, Equatable {
    var id: UUID { get }
    
    var productID: Int { get }
    var title: String { get }
    var image: String { get }
    var price: Double { get }
    var currencyIcon: String { get }
    var sticker: Sticker? { get }
}
