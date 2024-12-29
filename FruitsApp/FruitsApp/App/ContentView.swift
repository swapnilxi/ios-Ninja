//
//  ContentView.swift
//  FruitsApp
//
//  Created by Swap-Dev on 4/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSettings: Bool = false
    
    var fruits: [Fruit] = fruitsData

    // MARK: - BODY

    var body: some View {
      NavigationView {
        List {
          ForEach(fruits.shuffled()) { item in
            NavigationLink(destination: FruitDetailView(fruit: item)) {
              FruitRowView(fruit: item)
                .padding(.vertical, 4)
            }
          }
        }
        .navigationTitle("Fruits")
        .navigationBarItems(
          trailing:
            Button(action: {
              isShowingSettings = true
            }) {
              Image(systemName: "slider.horizontal.3")
            } //: BUTTON
            .sheet(isPresented: $isShowingSettings) {
              SettingsView()
            }
        )
      } //: NAVIGATION
      .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
