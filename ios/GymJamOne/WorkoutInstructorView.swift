//
//  WorkoutInstructorView.swift
//  GymJamOne
//
//  Created by Rahul Madduluri on 10/1/19.
//  Copyright © 2019 GymJam. All rights reserved.
//

import SwiftUI
import AVKit

struct WorkoutInstructorView: UIViewRepresentable {

  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<WorkoutInstructorView>) {
  }
  func makeUIView(context: Context) -> UIView {
    // create PlayerUIView
    return WorkoutInstructorUIView(frame: .zero)
  }
}

class WorkoutInstructorUIView: UIView {

  private let playerLayer = AVPlayerLayer()

  override init(frame: CGRect) {
    super.init(frame: frame)

    guard let path = Bundle.main.path(forResource: "hiit_example_sample", ofType:"mp4") else {
        debugPrint("hiit_example_sample.mp4 not found")
        return
    }
    let player = AVPlayer(url: URL(fileURLWithPath: path))
    player.play()

    playerLayer.player = player
    layer.addSublayer(playerLayer)
  }
  required init?(coder: NSCoder) {
   fatalError("init(coder:) has not been implemented")
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    playerLayer.frame = bounds
  }
}
