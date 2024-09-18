//
//  ContentView.swift
//  local-tv-video-reality-kit
//
//  Created by Abundent on 16/09/24.
//

import SwiftUI
import RealityKit
import AVFoundation

struct ContentView : View {
    var body: some View {
        Text("TV UI with Local Modal")
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        spawnTV(in: arView)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
    func spawnTV(in arView: ARView) {
        let dimensions: SIMD3<Float> = [1.23, 0.046, 0.7]
        
        //create TV Housing
        let housingMesh = MeshResource.generateBox(size:dimensions )
        let housingMaterial = SimpleMaterial(color: .black, roughness: 0.4, isMetallic: false)
        let housingEntity = ModelEntity(mesh: housingMesh, materials: [housingMaterial])
        
        //creating TV Screen
        let screenMesh = MeshResource.generatePlane(width: dimensions.x, depth: dimensions.z)
        let screenMaterial = SimpleMaterial(color: .white, roughness: 0.2 , isMetallic: false)
        let screenEntity = ModelEntity(mesh: screenMesh, materials: [screenMaterial])
        screenEntity.name = "tvScreen"
        
        //placement of screen over housing
        housingEntity.addChild(screenEntity)
        screenEntity.setPosition([0,dimensions.y/2 + 0.001,0], relativeTo: housingEntity)
        // creating anchor to palce tv on wall
       let anchor  = AnchorEntity(plane: .vertical)
        anchor.addChild(housingEntity)
        arView.scene.addAnchor(anchor)
        arView.enableTapGesture()
        housingEntity.generateCollisionShapes(recursive: true)
    }
}

extension ARView{
    func enableTapGesture(){
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(handleTap(recognizer:)))
        self.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer){
        let tapLocation = recognizer.location(in: self)
        
        if let entity = self.entity ( at: tapLocation) as? ModelEntity ,
           entity.name == "tvScreen"{
            loadVideoMaterial(for : entity)
            
        }
    }
    
    func loadVideoMaterial(for entity: ModelEntity){
        if let url = Bundle.main.url(forResource: "DemoVideo", withExtension: "mov") {
            let asset = AVURLAsset(url: url)
            print("Loaded asset: \(asset)")
            
            // Create an AVPlayerItem from the AVURLAsset
            let playerItem = AVPlayerItem(asset: asset)
            
            // Create an AVPlayer and assign the player item
            let player = AVPlayer()
            
            // Assuming you are working with RealityKit and applying the video as material
            // Set the video material to an entity (such as a model or plane in RealityKit)
            entity.model?.materials = [VideoMaterial(avPlayer: player)]
            player.replaceCurrentItem(with: playerItem)
            
            
            // Start playing the video
            player.play()
            
        } else {
            print("Error: Video file not found.")
        }
    }
    
}


#Preview {
    ContentView()
}
