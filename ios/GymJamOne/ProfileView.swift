//
//  ProfileView.swift
//  GymJamOne
//
//  Created by Rahul Madduluri on 10/5/19.
//  Copyright © 2019 GymJam. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Image("hammad")
                .resizable()
                .frame(width: 50, height: 50)
            Text("Robert DeNiro")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
