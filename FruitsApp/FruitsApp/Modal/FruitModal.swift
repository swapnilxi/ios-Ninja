//
//  FruitModal.swift
//  FruitsApp
//
//  Created by Swap-Dev on 4/30/24.
//

import SwiftUI

//MARK: FRUIT DATA MODAL

struct Fruit: Identifiable{
    
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
