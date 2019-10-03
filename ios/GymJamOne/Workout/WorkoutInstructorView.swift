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

    let player: AVPlayer

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<WorkoutInstructorView>) {
    }
    func makeUIView(context: Context) -> UIView {
        return WorkoutInstructorUIView(player: player)
    }
}

class WorkoutInstructorUIView: UIView {

  private let playerLayer = AVPlayerLayer()
    
    init(player: AVPlayer) {
        super.init(frame: .zero)
        
        // play audio out loud
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        }
        catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }

        // add to layer
        playerLayer.player = player
        layer.addSublayer(playerLayer)
        
        player.play()
    }

    required init?(coder: NSCoder) {
   fatalError("init(coder:) has not been implemented")
  }
    
  override func layoutSubviews() {
    super.layoutSubviews()
    playerLayer.frame = bounds
  }
    
}
