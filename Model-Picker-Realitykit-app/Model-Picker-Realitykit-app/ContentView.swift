//
//  ContentView.swift
//  Model-Picker-Realitykit-app
//
//  Created by Abundent on 05/09/24.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var models: [String] = ["toy_drummer_idle",
                            "sneaker_airforce",
                            "CosmonautSuit"]
    var body: some View {
        Text("Hello world")
        ZStack(alignment: .bottom){
            ARViewContainer()
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:30){
                    ForEach(0..<self.models.count){
                        index in
//                        Text(self.models[index])
                        Button(action:{},
                               label:{}
    
                        )
                        
                    }
                }
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        return arView;
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#Preview {
    ContentView()
}
