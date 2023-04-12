//
//  PartialSlideAnimation.swift
//  WalleTon
//
//  Created by Arseni Laputska on 12.04.23.
//

import SwiftUI

public struct PSSlideAnimation {
    var slideIn: Animation
    var slideOut: Animation

    /// The default slide in/out animation of the partial sheet
    private(set) var defaultSlideAnimation: Animation = {
        .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0)
    }()

    public init(slideIn: Animation? = nil, slideOut: Animation? = nil) {
        self.slideIn = slideIn ?? defaultSlideAnimation
        self.slideOut = slideOut ?? defaultSlideAnimation
    }
}
