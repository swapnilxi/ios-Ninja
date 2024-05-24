//
//  CategoryGridView.swift
//  Swift-Commerce
//
//  Created by Swap-Dev on 5/19/24.
//

import SwiftUI

struct CategoryGridView: View {
    var body: some View {
        ScrollView(content: {
            Text("Categories")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            LazyHGrid(
                rows:gridLayout,
                
                content: {
                    Section(
                      header: SectionView(rotateClockwise: false),
                      footer: SectionView(rotateClockwise: true)
                    ) {
                      ForEach(categories) { category in
                        CategoryItemView(category: category)
                      }
                    }
                  }//GRIDContent
            )//: GRID
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }//anoter View inside ScrollView
        )//ScrollView
    }
}

#Preview {
    CategoryGridView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(colorBackground)
}
