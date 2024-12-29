//
//  CustomButtonView.swift
//  Hike
//
//  Created by Swap-Dev on 4/4/24.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle().fill(
                LinearGradient(colors:  [.white,.customGreenDark,.customGreenLight],
                           startPoint: .top, endPoint: .bottom))
           
            Image(systemName: "figure.hiking")
              .fontWeight(.black)
              .font(.system(size: 30))
              .foregroundStyle(
                LinearGradient(
                  colors: [
                    .customGrayLight,
                    .customGrayMedium],
                  startPoint: .top,
                  endPoint: .bottom)
              )
            
            Circle()
                .stroke(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom),lineWidth:4 )
        }.frame(width: 58, height: 58)
        
    }
}

#Preview {
    CustomButtonView()
        .previewLayout(.sizeThatFits)
        .padding()
}
