//
//  BannerView.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 22.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct BannerView: View {
    
    let banner: Banner
    
    var body: some View {
        WebImage(url: URL(string: banner.image))
            .resizable()
            .placeholder(Image("logo.large"))
            .scaledToFit()
            .frame(maxWidth: .infinity)
    }
}

#Preview("Banner", traits: .sizeThatFitsLayout) {
    BannerView(banner: .preview)
}
