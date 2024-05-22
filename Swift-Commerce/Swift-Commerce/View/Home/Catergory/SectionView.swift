//
//  SectionView.swift
//  Swift-Commerce
//
//  Created by Swap-Dev on 5/19/24.
//

import SwiftUI

struct SectionView: View {
    @State var rotateClockwise: Bool
    
    // MARK: - BODY
    
    var body: some View {
      VStack(spacing: 0) {
        Spacer()
        
        Text("Categories".uppercased())
          .font(.footnote)
          .fontWeight(.bold)
          .foregroundColor(.white)
          .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))
        
        Spacer()
      } //: VSTACK
      .background(colorGray.cornerRadius(12))
      .frame(width: 85)
    }
}

#Preview {
    SectionView(rotateClockwise: true)
        .previewLayout(.fixed(width: 120, height: 240))
        .padding()
        .background(colorBackground)
}
