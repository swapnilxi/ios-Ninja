//
//  CategoryItemView.swift
//  Swift-Commerce
//
//  Created by Swap-Dev on 5/19/24.
//

import SwiftUI

struct CategoryItemView: View {
    let category: Category

    var body: some View {
        Button(action: {}, label: {
          HStack(alignment: .center, spacing: 6) {
            Image(category.image)
              .renderingMode(.template)
              .resizable()
              .scaledToFit()
              .frame(width: 30, height: 30, alignment: .center)
              .foregroundColor(.gray)
            
            Text(category.name.uppercased())
              .fontWeight(.light)
              .foregroundColor(.gray)
            
            Spacer()
          } //: HSTACK
          .padding()
          .background(Color.white.cornerRadius(12))
          .background(
            Rectangle()
              .stroke(Color.gray, lineWidth: 1)
          )
        }) //: BUTTON
    }
}

#Preview {
    CategoryItemView(
        category: categories[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    
}
