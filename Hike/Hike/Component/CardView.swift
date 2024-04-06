//
//  CardView.swift
//  Hike
//
//  Created by Swap-Dev on 4/3/24.
//

import SwiftUI

struct CardView: View {
    //Mark- properties
    @State private var imageNumber:Int=1;
    @State private var randomNumber:Int=1;
    
    //Mark - function
    func randomImage(){
        repeat{
        randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    
    
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
                    CustomCircleView();
                     Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 1), value: imageNumber)
                }
                //Mark-footer
                Button {
                  // ACTION: Generate a random number
                  
                  randomImage()
                } label: {
                  Text("Explore More")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(
                      LinearGradient(
                        colors: [
                          .customGreenLight,
                          .customGreenMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                      )
                    )
                    .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
                
            }//:V Stack
        }//: CARD
        .frame(width:320,height: 570)
    }
}

#Preview {
    CardView()
}
