//
//  ContentView.swift
//  Swift-Commerce
//
//  Created by Swap-Dev on 5/14/24.
//

import SwiftUI

struct ContentView: View {
    // Mark: -
    @EnvironmentObject var shop: Shop

    var body: some View {
        ZStack{
            
            //featured tab
            FeaturedTabView()
                .frame(height: UIScreen.main.bounds.width / 1.476) 
                .padding(.vertical, 20)
            // This will fix the layout rendering priority issue by using the screen's aspect ratio.

            
            //Product Section
            TitleView(title: "Products")
            ForEach(products) { product in
                ProductItemView(product: product)
            }//loop
            .padding(15)

            
            //category Section
            CategoryGridView()

            //Brand Section
            TitleView(title: "Brands")
            BrandGridView()
            FooterView()
                .padding(.horizontal)
            
        }//Zstack
        .ignoresSafeArea(.all, edges: .top)
       
        
    }
}

#Preview {
    ContentView()
}
