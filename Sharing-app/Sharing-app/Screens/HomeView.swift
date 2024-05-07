//
//  HomeScreen.swift
//  Sharing-app
//
//  Created by Swap-Dev on 4/15/24.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive:Bool = false
    var body: some View {
        VStack {
            Text("HomeScreen!").font(.largeTitle)
            Button(action:{
                 //onboarding true
                isOnboardingViewActive=true
            }){
                Text("start")
            }
        }
       
        
    }
}

#Preview {
 HomeView()
}
