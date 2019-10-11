//
//  ContentView.swift
//  GymJamOne
//
//  Created by Rahul Madduluri on 9/21/19.
//  Copyright © 2019 GymJam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedView = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
    }
    
    var body: some View {
        TabView(selection: $selectedView) {
            WorkoutView()
                .tabItem {
                    Image("workout_icon")
                    Text("Work Out")
                }
                .tag(0)
            Text("Second View")
                .tabItem {
                    Image("friends_icon")
                    Text("Fam")
                }.tag(1)
            ProfileView()
                .tabItem {
                    Image("profile_icon")
                    Text("Me")
                }.tag(2)
        }
            .accentColor(Color.primaryColor())
            .edgesIgnoringSafeArea(.top)
            .environment(\.colorScheme, .dark)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
