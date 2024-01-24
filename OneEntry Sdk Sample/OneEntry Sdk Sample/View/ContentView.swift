//
//  ContentView.swift
//  OneEntry Sdk Sample
//
//  Created by Артур Данилов on 09.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fetchingViewModel = DataFetchingViewModel()
            
    var body: some View {
        switch fetchingViewModel.fetchingStatus {
            case .success: 
                AppNavigationView()
                    .environmentObject(fetchingViewModel.homeViewModel)
                
            case .failure: 
                Text("Error")
                
            case .loading: 
                Text("Loading")
                    .task(fetchingViewModel.fetch)
        }
    }
}

#Preview {
    ContentView()
}
