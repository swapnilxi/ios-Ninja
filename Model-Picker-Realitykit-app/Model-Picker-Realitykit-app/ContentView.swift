//
//  ContentView.swift
//  Model-Picker-Realitykit-app
//
//  Created by Abundent on 05/09/24.
//

import SwiftUI
import RealityKit

struct ContentView : View {
//    var models: [String] = ["toy_drummer_idle",
//                            "sneaker_airforce",
//                            "CosmonautSuit"]
    
    //ading state
    @State var isPlacementEnabled: Bool = false;
    
    private var models: [String] = {
    // Dynamically get our model filenames
    let filemanager = FileManager.default
    guard let path = Bundle.main.resourcePath, let
    files = try?
    filemanager.contentsOfDirectory(atPath:
    path) else {
    return[]
    }
    var availableModels: [String] = []
    for filename in files where
    filename.hasSuffix ("usdz") {
    let modelName = filename.replacingOccurrences(of:
    ".usdz", with: "")
        availableModels.append (modelName)
    }
        return availableModels
    } ()
    
    
    var body: some View {
        Text("Hello world")
        ZStack(alignment: .bottom){
            ARViewContainer()
            
            ModelPickerView(models: self.models)
            PlacementButtonView()
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

struct PlacementButtonView : View {
    var body: some View{
        HStack{
            // Cancel button
            Button(action: {
                print("DEBUG: Cancel Model placement")
            }) {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
            
            // Confirm button
            Button(action: {
                print("DEBUG: Model placement confirmed")
            }) {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
        }//HStack
    }
}

struct ModelPickerView: View {
    
    var models: [String]
    var body : some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:30){
                ForEach(0 ..< self.models.count){
                    index in
                    //                        Text(self.models[index])
                    Button(action:{
                        print("DEBUG: Selected Model with name\(self.models[index])")
                    }){
                        if let uiImage = UIImage(named: self.models[index]) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .frame(height: 80)
                                .aspectRatio(1/1, contentMode: .fit)
                                .background(Color.white)
                                .cornerRadius(12)
                        } else {
                            Text("Image not found")
                                .frame(height: 80)
                                .aspectRatio(1/1, contentMode: .fit)
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                                .cornerRadius(12)
                                .padding()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        
    }
}
    


#Preview {
    ContentView()
}
