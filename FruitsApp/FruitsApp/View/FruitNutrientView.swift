//
//  FruitNutrientView.swift
//  FruitsApp
//
//  Created by Swap-Dev on 5/6/24.
//

import SwiftUI

struct FruitNutrientView: View {
    // MARK: - PROPERTIES
    var fruit: Fruit
    let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    var body: some View {
      GroupBox() {
        DisclosureGroup("Nutritional value per 100g") {
          ForEach(0..<nutrients.count, id: \.self) { item in
              
            Divider().padding(.vertical, 2)
              
             
            
            HStack {
                
                Group {
                  Image(systemName: "info.circle")
                  Text(nutrients[item])
                }
//                .foregroundColor(fruit.gradientColors[1])
                .font(Font.system(.body).bold())
              
              Spacer(minLength: 25)
                
              Text(fruit.nutrition[item])
                .multilineTextAlignment(.trailing)
            }//:Hstack
          }
        }// Disclosure Group - accordian
      } //: BOX
    }
}

#Preview {
    FruitNutrientView(fruit: fruitsData[0])
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 375, height: 480))
        .padding()
}
