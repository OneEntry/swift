//
//  Colors.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 09.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI

extension LinearGradient {
    
    static let background = LinearGradient(colors: [ .init(uiColor: #colorLiteral(red: 1, green: 0.2705882353, blue: 0.1254901961, alpha: 0.8)), .init(uiColor: #colorLiteral(red: 0.9843137255, green: 0.4980392157, blue: 0.05490196078, alpha: 1)), .init(uiColor: #colorLiteral(red: 0.9882352941, green: 0.9529411765, blue: 0.6392156863, alpha: 1)), .init(uiColor: #colorLiteral(red: 1, green: 0.8509803922, blue: 0.1529411765, alpha: 1))], startPoint: .top, endPoint: .bottom)
}

#Preview {
    LinearGradient.background.ignoresSafeArea()
}
