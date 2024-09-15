//
//  ContentView.swift
//  Model-Picker-Realitykit-app
//
//  Created by Abundent on 05/09/24.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
//    var models: [String] = ["toy_drummer_idle",
//                            "sneaker_airforce",
//                            "CosmonautSuit"]
    
    //ading state
    @State var isPlacementEnabled: Bool = false ;
    @State var selectedModel: String?
    @State var modelConfirmForPlacment: String?
     
    
    
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
            ARViewContainer(ModelConfirmedForPlacement: self.$modelConfirmForPlacment)
            if self.isPlacementEnabled{
                PlacementButtonView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, modelConfiremedForPlacement: self.$modelConfirmForPlacment)
             }else{
                 ModelPickerView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel , models: self.models)
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var ModelConfirmedForPlacement: String?
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let config =  ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if
            ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            config.sceneReconstruction = .mesh
        }
        arView.session.run( config )
        return arView;
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let modelName = self.ModelConfirmedForPlacement{
            print("DEBUG: Adding model to the scene - \(modelName)")
            //this will give error because we are replacing while updating
            //error: Modifying state during view update, this will cause undefined behavior.

//            self.ModelConfirmedForPlacement = nil
            
            let filename = modelName + ".usdz"
            let modelEntity = try!
                ModelEntity.loadModel(named: modelName)
            let anchorEntity = AnchorEntity(plane: .any)
            anchorEntity.addChild(modelEntity)
            uiView.scene.addAnchor(anchorEntity)
            
            DispatchQueue.main.async {
                self.ModelConfirmedForPlacement = nil
            }
            
            
        }
        
   
        
    }
    
}

struct PlacementButtonView : View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: String?
    @Binding var modelConfiremedForPlacement: String?
    
    var body: some View{
        HStack{
            // Cancel button
            Button(action: {
                print("DEBUG: Cancel Model placement")
                self.resetPlacementParameters()
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
                self.modelConfiremedForPlacement = self.selectedModel
                self.resetPlacementParameters()
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
    func resetPlacementParameters (){
         self.isPlacementEnabled = false
        self.selectedModel = nil
    }
    
}

struct ModelPickerView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: String?
    
    var models: [String]
    var body : some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:30){
                ForEach(0 ..< self.models.count){
                    index in
                    //                        Text(self.models[index])
                    Button(action:{
                        print("DEBUG: Selected Model with name\(self.models[index])")
                        
                        self.selectedModel=self.models[index]
                        self.isPlacementEnabled = true
                        
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
