//
//  SettingsLabelView.swift
//  FruitsApp
//
//  Created by Swap-Dev on 5/8/24.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: - PROPERTIES
    
    var labelText: String
    var labelImage: String
    
    var body: some View {
        HStack {
          Text(labelText.uppercased()).fontWeight(.bold)
          Spacer()
          Image(systemName: labelImage)
        }
    }
}

#Preview {
    SettingsLabelView(labelText: "Fruits App", labelImage: "info.circle")
        .previewLayout(.sizeThatFits)
        .padding()
}
