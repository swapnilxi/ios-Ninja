//
//  BrandItemView.swift
//  Swift-Commerce
//
//  Created by Swap-Dev on 5/23/24.
//

import SwiftUI

struct BrandItemView: View {
    // MARK: - PROPERTY
    let brand: Brand
    var body: some View {
        Image(brand.image)
          .resizable()
          .scaledToFit()
          .padding(3)
          .background(Color.white.cornerRadius(12))
          .background(
            Rectangle().stroke(Color.gray, lineWidth: 1)
          )//Image
    }
}

#Preview {
    BrandItemView(brand: brands[0])
        .previewLayout(.sizeThatFits)
        .padding()
        .background(colorBackground)
    
}
