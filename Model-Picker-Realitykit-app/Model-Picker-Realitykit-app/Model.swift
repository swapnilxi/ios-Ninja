//
//  Model.swift
//  Model-Picker-Realitykit-app
//
//  Created by Abundent on 13/09/24.
//

 
import UIKit
import RealityKit
import Combine

class Model {
    var modelName : String
    var image: UIImage?
    var modelEntity: ModelEntity?
    
    private var cancellable : AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        self.image =  UIImage(named: modelName)!
        
        
        let fileName = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: fileName)
            .sink(receiveCompletion: { loadCompletion in
                //HandleOur Error
                print("DEBUG: Unable to load Model Entity for : \(self.modelName)")
                
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                print("Sucessfully loaded the model Entity for model name: \(self.modelName)")
                
            }
            )

    }
}
