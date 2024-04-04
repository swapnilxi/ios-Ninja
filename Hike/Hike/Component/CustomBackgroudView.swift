//
//  CustomBackgroudView.swift
//  Hike
//
//  Created by Swap-Dev on 4/3/24.
//

import SwiftUI

struct CustomBackgroudView: View {
    var body: some View {
        ZStack {
            // MARK: - 3. DEPTH
    
            Color.customGreenDark
              .cornerRadius(40)
              .offset(y: 12)
            
            // MARK: - 2. LIGHT
            
            Color.customGreenLight
              .cornerRadius(40)
              .offset(y: 3)
              .opacity(0.85)
            
            // MARK: - 1. SURFACE
            
            
            //Gradient-Background 
            
            LinearGradient(colors: [Color("ColorGreenLight"), Color("ColorGreenMedium")] , startPoint:.top, endPoint: .bottom)
                .cornerRadius(40)
        }
            
    }
}

#Preview {
    CustomBackgroudView()
        .padding( )
}
