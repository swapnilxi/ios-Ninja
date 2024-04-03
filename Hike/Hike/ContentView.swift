//
//  ContentView.swift
//  Hike
//
//  Created by Swap-Dev on 4/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("image-1")
                .resizable()
                .scaledToFit()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
