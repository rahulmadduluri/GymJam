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
                    Image("calendar_icon")
                    Text("Calendar")
                }.tag(1)
            ProfileView()
                .tabItem {
                    Image("profile_icon")
                    Text("Me")
                }.tag(2)
        }
            .environment(\.colorScheme, .dark)
            .accentColor(Color.white)
            .edgesIgnoringSafeArea(.top)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
