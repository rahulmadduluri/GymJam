//
//  WorkoutStatsView.swift
//  GymJamOne
//
//  Created by Rahul Madduluri on 10/1/19.
//  Copyright © 2019 GymJam. All rights reserved.
//

import SwiftUI

struct WorkoutStatsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Blistering Twisters")
                .font(Font.custom("Rubik-Medium", size: 24))
                .foregroundColor(Color.white)
            HStack(alignment: .center, spacing: 40) {
                VStack {
                    HStack(spacing: -5) {
                        Image("fitness_emoji_male")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Image("fitness_emoji_female")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                    Text("Friend")
                        .frame(minWidth: 50, maxWidth: 50)
                        .font(Font.custom("Rubik-Regular", size: 16))
                        .foregroundColor(Color.white)
                }
                VStack {
                    Image("reps")
                        .resizable()
                        .frame(width: 35, height: 35)
                    Text("Reps")
                        .frame(minWidth: 50, maxWidth: 50)
                        .font(Font.custom("Rubik-Regular", size: 16))
                        .foregroundColor(Color.white)
                }
            }
        }.frame(minWidth: 300, maxWidth: 300, minHeight: 0, maxHeight: .infinity, alignment: .top).padding()
    }
}

struct WorkoutStatsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutStatsView()
    }
}
