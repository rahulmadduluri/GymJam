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

class RealityViewController: UIViewController {
    
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return .portrait
//    }
//
//    override open var shouldAutorotate: Bool {
//        return false
//    }
            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add a background color a placerholder
        //Comment out below this when previewing!
        // Create a new ARView
        let arView = ARView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/UIScreen.main.bounds.height * UIScreen.main.bounds.width))
        // Add the ARView to the view
        view.addSubview(arView)
        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
        
        if ARBodyTrackingConfiguration.isSupported {
            let configuration = ARBodyTrackingConfiguration()
            arView.session.run(configuration)
        }
        let bodyAnchor = AnchorEntity(.body)
        arView.scene.anchors.append(bodyAnchor)
        
        Entity.loadBodyTrackedAsync(named: "robot").sink(receiveCompletion: { (error) in
            //error
        }) { (character) in
            bodyAnchor.addChild(character)
        }
        
    }
    
}
