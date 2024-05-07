//
//  OnboardingScreen.swift
//  Sharing-app
//
//  Created by Swap-Dev on 4/15/24.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button(action:{
                 //onboarding true
                isOnboardingViewActive=false
            }){
                Text("go to home")
            }
        }
       
    }
}

#Preview {
    OnboardingView()
}
