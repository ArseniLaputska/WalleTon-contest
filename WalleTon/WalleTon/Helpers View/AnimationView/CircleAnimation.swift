//
//  CircleAnimation.swift
//  WalleTon
//
//  Created by Arseni Laputska on 28.03.23.
//

import SwiftUI

struct CircleAnimation: View {
    
    @State var isAnimating: Bool = false
    let color: Color
    
    var body: some View {
        Circle()
            .trim(from: 0, to: isAnimating ? 1 : 0)
            .stroke(color, lineWidth: 2)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .transition(.move(edge: .top))
            .animation(.linear(duration: 1.5).repeatForever(autoreverses: false), value: isAnimating)
            .onAppear {
                isAnimating = true
            }
    }
}
