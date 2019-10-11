//
//  WorkoutCameraViewAR.swift
//  GymJamOne
//
//  Created by Rahul Madduluri on 10/10/19.
//  Copyright © 2019 GymJam. All rights reserved.
//

import SwiftUI
import RealityKit

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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add a background color a placerholder
        view.backgroundColor = .systemBlue
        //Comment out below this when previewing!
        // Create a new ARView
        let arView = ARView(frame: UIScreen.main.bounds)
        // Add the ARView to the view
        view.addSubview(arView)
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
}
