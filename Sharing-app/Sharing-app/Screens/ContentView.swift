//
//  ContentView.swift
//  Sharing-app
//
//  Created by Swap-Dev on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
      ZStack {
        if isOnboardingViewActive {
            OnboardingView()
        } else {
          HomeView()
        }
      }
    }
}

#Preview {
    ContentView()
}
