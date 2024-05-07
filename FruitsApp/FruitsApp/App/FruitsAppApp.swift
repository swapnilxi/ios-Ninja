//
//  FruitsAppApp.swift
//  FruitsApp
//
//  Created by Swap-Dev on 4/28/24.
//

import SwiftUI

@main
struct FruitsAppApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                OnboardingView()
            } else{
                ContentView()
            }
        }
    }
}
