//
//  FeatureItemView.swift
//  Swift-Commerce
//
//  Created by Swap-Dev on 5/23/24.
//

import SwiftUI

struct FeaturedItemView: View {
    let player: Player

    var body: some View {
        Image(player.image)
          .resizable()
          .scaledToFit()
          .cornerRadius(12)
      }
    }


#Preview {
    FeaturedItemView(player: players[0])
}
