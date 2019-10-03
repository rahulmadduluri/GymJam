//
//  WorkoutCameraView.swift
//  GymJamOne
//
//  Created by Rahul Madduluri on 10/1/19.
//  Copyright © 2019 GymJam. All rights reserved.
//

import SwiftUI
import AVKit

struct WorkoutCameraView: UIViewRepresentable {

  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<WorkoutCameraView>) {
  }
  func makeUIView(context: Context) -> UIView {
    return WorkoutCameraUIView(frame: .zero)
  }
}

class WorkoutCameraUIView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  required init?(coder: NSCoder) {
   fatalError("init(coder:) has not been implemented")
  }
    
  override func layoutSubviews() {
    super.layoutSubviews()
  }
}
