//
//  StringError.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 20.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import Foundation

extension String: LocalizedError {    
    public var errorDescription: String? { self }
}
