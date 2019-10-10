//
//  WorkoutView.swift
//  GymJamOne
//
//  Created by Rahul Madduluri on 10/3/19.
//  Copyright © 2019 GymJam. All rights reserved.
//

import SwiftUI

struct WorkoutView: View {
    
    @State var isModal: Bool = false
        
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                ZStack(alignment: .bottom) {
                    Image(uiImage: UIImage(named: "workout_sample_pic")!)
                        .resizable()
                        .frame(width: 200, height: 320)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    Text("Blistering Twisters")
                        .font(Font.custom("Rubik-Medium", size: 18))
                        .foregroundColor(Color.white)
                        .offset(x: 0, y: -40)
                    Text("30 min - 128 calories")
                        .font(Font.custom("Rubik-Medium", size: 14))
                        .foregroundColor(Color.white)
                        .padding()
                }
                Text("Squats")
                    .frame(width: 140, height: 50)
                    .font(Font.custom("Rubik-Medium", size: 18))
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }.padding()
            WorkoutFriendElement()
                .padding()
                .frame(height: 180)
            Button(action: {
                self.isModal = true
            }) {
                HStack {
                    Image("flex_arm")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 35, height: 35, alignment: .center)
                    Text("Get Fit")
                        .foregroundColor(Color.white)
                        .font(Font.custom("Rubik-Medium", size: 30))
                }
                .padding()
                .background(Color.primaryColor())
                .cornerRadius(10)
            }.sheet(isPresented: $isModal, content: {
                WorkoutPlayer().onAppear() {
                    AppUtility.lockOrientation(.landscapeRight, andRotateTo: .landscapeRight)
                }
            })
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
