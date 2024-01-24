//
//  DataFetchingViewModel.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 20.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

@MainActor
final class DataFetchingViewModel: ObservableObject {
    
    @Published private(set) var fetchingStatus: FetchingStatus = .loading
    
    let homeViewModel = HomeViewModel()
    
    private var cancellable: Set<AnyCancellable> = .init()
    private var loadingPublisher: AnyPublisher<FetchingStatus, Never> {
        
        let list = [
            homeViewModel.$fetchingStatus.eraseToAnyPublisher(),
        ]
        
        return list.dropFirst().reduce(into: AnyPublisher(list[0].map{[$0]})) { res, b in
            res = res.combineLatest(b) { i1, i2 in
                return i1 + [i2]
            }
            .eraseToAnyPublisher()
        }
        .map(\.finalStatus)
        .eraseToAnyPublisher()
    }
    
    init() {
        loadingPublisher
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .sink { status in
                withAnimation {
                    self.fetchingStatus = status
                }
            }
            .store(in: &cancellable)
    }
    
    @Sendable
    func fetch() async {
        await withTaskGroup(of: Void.self) { group in
            group.addTask(operation: homeViewModel.fetch)
        }
    }
}
