//
//  WorkoutPlayer.swift
//  GymJamOne
//
//  Created by Rahul Madduluri on 10/1/19.
//  Copyright © 2019 GymJam. All rights reserved.
//

import SwiftUI
import AVKit

struct WorkoutPlayer: View {
    
    let player: AVPlayer
    
    init() {
        let instructorVideoPath = Bundle.main.path(forResource: "hiit_example_sample", ofType:"mp4")!
        player = AVPlayer(url: URL(fileURLWithPath: instructorVideoPath))
    }
        
    var body: some View {
        HStack {
            WorkoutInstructorView(player: player)
                .onDisappear() {
                    self.player.pause()
                }
            WorkoutCameraView()
            WorkoutStatsView()
        }
    }
}

struct WorkoutPlayer_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutPlayer()
    }
}
