//
//  WorkoutView.swift
//  GymJamOne
//
//  Created by Rahul Madduluri on 10/3/19.
//  Copyright © 2019 GymJam. All rights reserved.
//

import SwiftUI
import VideoPlayer

struct WorkoutView: View {
    
    @State var isModal: Bool = false
    
    let backgroundVideoURL: URL
    @State var isPlay: Bool = true
    @State var isAutoReplay: Bool = true
    @State var isMute: Bool = true
    
    init() {
        let videoPath = Bundle.main.path(forResource: "trimmed_boxing", ofType:"mp4")!
        backgroundVideoURL = URL(fileURLWithPath: videoPath)
    }
        
    var body: some View {
        ZStack {
            VideoPlayerView(url: .constant(backgroundVideoURL), isPlay: $isPlay)
                .autoReplay($isAutoReplay)
                .mute($isMute)
                .frame(minWidth: 425, alignment: .top)
                .edgesIgnoringSafeArea(.all)
//            Image(uiImage: UIImage(named: "workout_sample_pic")!)
//                .resizable()
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//                .edgesIgnoringSafeArea(.top)

            VStack {
                Text("Boxing Bonanza")
                    .font(Font.custom("Rubik-Medium", size: 20))
                    .foregroundColor(Color.white)
                Text("30 min")
                    .font(Font.custom("Rubik-Medium", size: 14))
                    .foregroundColor(Color.white)
                    .offset(x: 0, y: 5)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            
            
            WorkoutFriendElement()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .offset(x: 0, y: 100)
                .padding()

            Button(action: {
                self.isModal = true
            }) {
                HStack {
                    Image("flex_arm")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 30, height: 30, alignment: .center)
                    Text("Work Out")
                        .foregroundColor(Color.white)
                        .font(Font.custom("Rubik-Medium", size: 24))
                }
                .padding()
                .background(Color.primaryColor())
                .cornerRadius(10)
            }.sheet(isPresented: $isModal, content: {
                WorkoutPlayer().onAppear() {
                    AppUtility.lockOrientation(.landscapeRight, andRotateTo: .landscapeRight)
                }
            })
                .shadow(radius: 20)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(x: 0, y: -50)
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
