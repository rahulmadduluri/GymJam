//
//  WorkoutPlayer.swift
//  GymJamOne
//
//  Created by Rahul Madduluri on 10/1/19.
//  Copyright © 2019 GymJam. All rights reserved.
//

import SwiftUI

struct WorkoutPlayer: View {
        
    var body: some View {
        HStack {
            WorkoutInstructorView()
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
