//
//  WorkoutFriendElement.swift
//  GymJamOne
//
//  Created by Rahul Madduluri on 10/4/19.
//  Copyright © 2019 GymJam. All rights reserved.
//

import SwiftUI


struct WorkoutFriendUIElement: Hashable, Codable {
    var imageName: String
    var userName: String
}

struct WorkoutFriendElement: View {
    
    let workoutFriendElements = [WorkoutFriendUIElement(imageName: "hammad", userName: "hammadtime"), WorkoutFriendUIElement(imageName: "praful", userName: "praful"), WorkoutFriendUIElement(imageName: "reia", userName: "rcho99"), WorkoutFriendUIElement(imageName: "invite", userName: " ")]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Who's Doing This Workout")
                .font(Font.custom("Rubik-Medium", size: 16))
            Spacer()
            Spacer()
            HStack {
                ForEach(workoutFriendElements, id: \.self) { wfe in
                    VStack {
                        Image("\(wfe.imageName)")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .cornerRadius(5)
                        Text("\(wfe.userName)")
                            .font(Font.custom("Rubik-Regular", size: 14))
                            .foregroundColor(Color.linkableColor())
                    }.frame(width: 90)
                }
            }
        }
    }
}

struct WorkoutFriendElement_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutFriendElement()
    }
}
