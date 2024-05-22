//
//  LogoView.swift
//  Swift-Commerce
//
//  Created by Swap-Dev on 5/19/24.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack(spacing: 4) {
          Text("Swift".uppercased())
            .font(.title3)
            .fontWeight(.black)
            .foregroundColor(.black)
          
          Image("logo-dark")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30, alignment: .center)
          
          Text("Commerce".uppercased())
            .font(.title3)
            .fontWeight(.black)
            .foregroundColor(.black)
        } //: HSTACK
      }
    }

#Preview {
    LogoView()
        .previewLayout(.sizeThatFits)
        .padding()
}
