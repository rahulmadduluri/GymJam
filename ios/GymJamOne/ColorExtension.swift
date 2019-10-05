//
//  ColorExtension.swift
//  GymJamOne
//
//  Created by Rahul Madduluri on 9/30/19.
//  Copyright © 2019 GymJam. All rights reserved.
//

import SwiftUI

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
    
    public static func primaryColor() -> Color {
        return Color(hex: 0x3F44B5)
    }
    
    public static func linkableColor() -> Color {
        return Color(hex: 0x2F80ED)
    }
}
