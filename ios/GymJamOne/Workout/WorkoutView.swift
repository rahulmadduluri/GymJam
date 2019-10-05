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
        VStack(spacing: 50) {
            VStack(alignment: .leading, spacing: 50) {
                Text("Tuesday's Jam")
                    .font(Font.custom("Rubik-Bold", size: 40))
                    .foregroundColor(Color.primaryColor())
                HStack(alignment: .top) {
                    Image(uiImage: UIImage(named: "workout_sample_pic")!)
                        .resizable()
                        .frame(width: 125, height: 200)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Blistering Twisters")
                            .font(Font.custom("Rubik-Medium", size: 18))
                        Spacer()
                        Text("Squats, Twists, Jumping Jacks")
                            .font(Font.custom("Rubik-Regular", size: 14))
                        Spacer()
                        Text("30 minutes")
                            .font(Font.custom("Rubik-Regular", size: 14))
                        Spacer()
                        Text("148 calories")
                            .font(Font.custom("Rubik-Regular", size: 14))
                    }
                }
                VStack {
                    Text("Friends doing this workout")
                        .font(Font.custom("Rubik-Medium", size: 18))
                    Spacer()
                    Spacer()
                    HStack {
                        VStack {
                            Image("hammad")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .cornerRadius(5)
                            Text("hammadtime")
                                .font(Font.custom("Rubik-Regular", size: 12))
                                .foregroundColor(Color.linkableColor())
                        }.frame(width: 90)
                        VStack {
                            Image("praful")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .cornerRadius(5)
                            Text("prafdhar")
                                .font(Font.custom("Rubik-Regular", size: 12))
                                .foregroundColor(Color.linkableColor())
                        }.frame(width: 90)
                        VStack {
                            Image("reia")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .cornerRadius(5)
                            Text("rcho99")
                                .font(Font.custom("Rubik-Regular", size: 12))
                                .foregroundColor(Color.linkableColor())
                        }.frame(width: 90)
                        VStack {
                            Image("invite")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .foregroundColor(Color.linkableColor())
                            Text("Invite")
                                .font(Font.custom("Rubik-Regular", size: 12))
                                .foregroundColor(Color.linkableColor())
                        }.frame(width: 90)
                    }
                }
            }
            .padding()
            
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
                .onDisappear() {
                    AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
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
