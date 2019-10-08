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
    
    let workoutFriendElements = [WorkoutFriendUIElement(imageName: "hammad", userName: "hammadtime"), WorkoutFriendUIElement(imageName: "praful", userName: "praful"), WorkoutFriendUIElement(imageName: "reia", userName: "rcho99")]
    
    var body: some View {
        VStack() {
            Text("Today's Jam Fam")
                .font(Font.custom("Rubik-Medium", size: 20))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
            ScrollView(.vertical, showsIndicators: false, content: {
                HStack() {
                    ForEach(workoutFriendElements, id: \.self) { wfe in
                        VStack {
                            Image("\(wfe.imageName)")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .cornerRadius(37.5)
                            Text("@"+"\(wfe.userName)")
                                .font(Font.custom("Rubik-Medium", size: 14))
                        }.frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
            })
        }
    }
}

struct WorkoutFriendElement_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutFriendElement()
    }
}
