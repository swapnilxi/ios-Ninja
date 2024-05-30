//
//  ProductTitleView.swift
//  Swift-Commerce
//
//  Created by Swap-Dev on 5/30/24.
//

import SwiftUI

struct TitleView: View {
    var title:String
    var body: some View {
        HStack{
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom,10)
        
    }
}

#Preview {
    TitleView(title: "Helmet")
        .previewLayout(.sizeThatFits)
        .background(colorBackground)
}
