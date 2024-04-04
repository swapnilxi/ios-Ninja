//
//  CardView.swift
//  Hike
//
//  Created by Swap-Dev on 4/3/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            CustomBackgroudView()
            VStack {
                // MARK: - HEADER
                
                VStack(alignment: .leading) {
                  HStack {
                    Text("Hiking")
                      .fontWeight(.black)
                      .font(.system(size: 52))
                      .foregroundStyle(
                        LinearGradient(
                          colors: [
                            .customGrayLight,
                            .customGrayMedium],
                          startPoint: .top,
                          endPoint: .bottom)
                      )
                    
                    Spacer()
                    
                    Button {
                      // ACTION: Show a Sheet
                      print("The button was pressed.")
                    } label: {
                      CustomButtonView()
                    }
                    
                  }
                  
                  Text("Fun and enjoyable outdoor activity for friends and families.")
                    .multilineTextAlignment(.leading)
                    .italic()
                    .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                
                // Mark- main content
                ZStack {
                    Circle()
                    .fill(
                     LinearGradient(colors: [Color("ColorIndigoMedium"),
                          Color("ColorSalmonLight")],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing)
                    )
                    .frame(width: 256, height: 256)
                    
                     Image("image-1")
                        .resizable()
                    .scaledToFit()
                }
                //Mark-footer
                
                
            }//:VStack
        }//CARD
        .frame(width:320,height: 570)
    }
}

#Preview {
    CardView()
}
