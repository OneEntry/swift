//
//  FetchingStatus.swift
//  AR Garden
//
//  Created by Артур Данилов on 28.12.2023.
//

import Foundation

enum FetchingStatus {
    
    case success
    case failure
    case loading
    
    var ignoringFailureStatus: FetchingStatus {
        
        return self == .failure ? .success : self
    }
}

// MARK: - Transformation of the status array
extension [FetchingStatus] {
    
    var finalStatus: FetchingStatus {
        
        for status in self {
            
            switch status {
                case .success: continue
                case .failure: return .failure
                case .loading: return .loading
            }
        }
        
        return .success
    }
}
