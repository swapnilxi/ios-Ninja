//
//  SettingsView.swift
//  FruitsApp
//
//  Created by Swap-Dev on 5/8/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(spacing: 20){
                    
                    // MARK: - SECTION 1
                    
                    GroupBox(
                      label:
                        SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                    ) {
                      Divider().padding(.vertical, 4)
                      
                      HStack(alignment: .center, spacing: 10) {
                        Image("logo")
                          .resizable()
                          .scaledToFit()
                          .frame(width: 80, height: 80)
                          .cornerRadius(9)
                        
                        Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                          .font(.footnote)
                      }//hstack
                        
                    }//groupbox
                    
                    //section 2
                    
                    
                    
                }//vstack
                
                
                
            }//scroll view
            
        }//NavigationView
    }
}

#Preview {
    SettingsView()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 11 Pro")
}
