//
//  SettingsView.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 11.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Image("logo.large")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200)
                
                Spacer()
                
                SettingsRows()
                
                Spacer(minLength: 300)
                
                Button("Sign out") {
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(red: 0.9467220902, green: 0.9499948621, blue: 0.9531205297))
                .clipShape(Capsule())
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
            }
            .padding()
        }
    }
    
    @ViewBuilder
    func SettingsRows() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            NavigationLink(destination: Text("My Profile")) {
                SettingsRow(title: "My Profile", systemName: "person.circle")
            }
            
            NavigationLink(destination: Text("My Orders")) {
                SettingsRow(title: "My Orders", systemName: "checklist.checked")
            }
                        
            Button {
                appViewModel.activeScreen = .favorites
            } label: {
                SettingsRow(title: "Favorites", systemName: "heart")
            }
            
            NavigationLink(destination: Text("Payments")) {
                SettingsRow(title: "Payments", systemName: "creditcard")
            }
        }
        .foregroundStyle(.gray)
    }
}

@ViewBuilder
func SettingsRow(title: String, systemName: String) -> some View {
    HStack(spacing: 15) {
        Image(systemName: systemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 22)
        
        Text(title)
    }
}

#Preview("SettingsView") {
    SettingsView()
        .environmentObject(AppViewModel())
}

#Preview("SettingsRow", traits: .sizeThatFitsLayout) {
    SettingsRow(title: "Payments", systemName: "creditcard")
}
