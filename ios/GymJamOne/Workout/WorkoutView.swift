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

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
