//
//  CircleAnimation.swift
//  WalleTon
//
//  Created by Arseni Laputska on 28.03.23.
//

import SwiftUI

struct CircleAnimation: View {
    
    @State var isAnimating: Bool = false
    
    var body: some View {
        Circle()
            .trim(from: 0, to: isAnimating ? 1 : 0)
            .stroke(Color.white, lineWidth: 3)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
            .onAppear {
                isAnimating.toggle()
            }
    }
}
