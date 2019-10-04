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
            Text("Tuesday Jam")
                .font(Font.custom("Rubik-Medium", size: 24))
            HStack(alignment: .center, spacing: 40) {
                Text("Friend").frame(minWidth: 50, maxWidth: 50)
                Text("Reps").frame(minWidth: 50, maxWidth: 50)
            }
        }.frame(minWidth: 300, maxWidth: 300, minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
}

struct WorkoutStatsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutStatsView()
    }
}
