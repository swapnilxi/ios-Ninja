//
//  RoundedRectangle.swift
//  Swift-Commerce
//
//  Created by Swap-Dev on 5/19/24.
//

import SwiftUI

struct RoundedRectangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath (roundedRect: rect,
                                 byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize( width: 35, height: 35))
        
        return Path(path.cgPath)
        
    }
    
}

#Preview {
    RoundedRectangle()
        .previewLayout(.fixed(width: 428, height: 170))
        .padding()
}
