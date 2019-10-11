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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showingQuitActionSheet = false
    
    let player: AVPlayer
    
    init() {        
        let instructorVideoPath = Bundle.main.path(forResource: "hiit_example_sample", ofType:"mp4")!
        player = AVPlayer(url: URL(fileURLWithPath: instructorVideoPath))
    }
            
    var body: some View {
        ZStack {
            Color.darkColor().edgesIgnoringSafeArea(.all)
            HStack {
//                WorkoutInstructorView(player: player)
                WorkoutCameraViewAR()//.rotationEffect(Angle.degrees(90))
                WorkoutStatsView()
            }
        }
            .gesture(
                DragGesture(minimumDistance: 50)
                    .onEnded { (_) in
                        self.showingQuitActionSheet = true
                    }
            )
            .actionSheet(isPresented: $showingQuitActionSheet) {
                ActionSheet(
                    title: Text("Quit Workout?"),
                    buttons: [
                        .cancel { self.showingQuitActionSheet = false },
                        .destructive(Text("Quit")) {
                            self.player.pause()
                            UIApplication.shared.isIdleTimerDisabled = false
                            AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    ]
                )
            }
    }
}

struct WorkoutPlayer_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutPlayer()
    }
}
