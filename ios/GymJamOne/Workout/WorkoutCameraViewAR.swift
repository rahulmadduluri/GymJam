//
//  WorkoutCameraViewAR.swift
//  GymJamOne
//
//  Created by Rahul Madduluri on 10/10/19.
//  Copyright © 2019 GymJam. All rights reserved.
//

import SwiftUI
import RealityKit
import ARKit
import Combine

struct WorkoutCameraViewAR: View {
    var body: some View {
        RealityIntegratedViewController()
    }
}

struct WorkoutCameraViewAR_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCameraViewAR()
    }
}

struct RealityIntegratedViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<RealityIntegratedViewController>) -> RealityIntegratedViewController.UIViewControllerType {
        return RealityViewController()
    }
    func updateUIViewController(_ uiViewController: RealityViewController, context: UIViewControllerRepresentableContext<RealityIntegratedViewController>) {
    }
}

class RealityViewController: UIViewController, ARSessionDelegate {
        
    // The 3D character to display.
    var character: BodyTrackedEntity?
    let characterAnchor = AnchorEntity(.body)
    var bodyAnchor: ARBodyAnchor?
    
    var label: UILabel?
    
    var testlol = 0
                
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add a background color a placerholder
        //Comment out below this when previewing!
        // Create a new ARView
        let arView = ARView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/UIScreen.main.bounds.height * UIScreen.main.bounds.width))
        arView.session.delegate = self
        
        guard ARBodyTrackingConfiguration.isSupported else {
            fatalError("This feature is only supported on devices with an A12 chip")
        }

        // Add the ARView to the view
        view.addSubview(arView)
        
        let configuration = ARBodyTrackingConfiguration()
        arView.session.run(configuration)

        arView.scene.anchors.append(characterAnchor)
        
        // Asynchronously load the 3D character.
        var cancellable: AnyCancellable? = nil
        cancellable = Entity.loadBodyTrackedAsync(named: "character/robot").sink(
            receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error: Unable to load model: \(error.localizedDescription)")
                }
                cancellable?.cancel()
        }, receiveValue: { (character: Entity) in
            if let character = character as? BodyTrackedEntity {
                // Scale the character to human size
                character.scale = [1.0, 1.0, 1.0]
                self.character = character
                cancellable?.cancel()
            } else {
                print("Error: Unable to load model as BodyTrackedEntity")
            }
        })
        
        // add text
        let testLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 300, height: 150))
        testLabel.font = UIFont(name: "Arial", size: 8)
        testLabel.numberOfLines = 0
        label = testLabel
        view.addSubview(testLabel)
        

    }
    
     func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
         for anchor in anchors {
            guard let bAnchor = anchor as? ARBodyAnchor else { continue }
            
            bodyAnchor = bAnchor
            let xDesc = bAnchor.skeleton.jointLocalTransforms.debugDescription
            label?.text = xDesc
            
             // Update the position of the character anchor's position.
//             let bodyPosition = simd_make_float3(bodyAnchor.transform.columns.3)
//             characterAnchor.position = bodyPosition
             // Also copy over the rotation of the body anchor, because the skeleton's pose
             // in the world is relative to the body anchor's rotation.
//             characterAnchor.orientation = Transform(matrix: bodyAnchor.transform).rotation
                
             if let character = character, character.parent == nil {
                 // Attach the character to its anchor as soon as
                 // 1. the body anchor was detected and
                 // 2. the character was loaded.
                 characterAnchor.addChild(character)
             }
         }
    }
    
}
