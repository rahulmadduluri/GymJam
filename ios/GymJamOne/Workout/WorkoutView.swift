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
        ZStack {
            Image(uiImage: UIImage(named: "workout_sample_pic")!)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .edgesIgnoringSafeArea(.top)

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
