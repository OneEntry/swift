//
//  OneEntryConnectionTest.swift
//  
//
//  Created by Артур Данилов on 14.12.2023.
//

import XCTest
import OneEntry

final class OneEntryConnectionTest: XCTestCase {
            
    func testExample() async throws {
        
        let _ = try await OneEntryProducts.shared.products(langCode: "en_US")
    }
}
