//
//  AnimationView.swift
//  WalleTon
//
//  Created by Arseni Laputska on 27.03.23.
//

import SwiftUI
import Lottie

struct AnimationView: UIViewRepresentable {

    let sticker: Stickers
    
    func makeUIView(context: UIViewRepresentableContext<AnimationView>) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView()
        
        do {
            let data = try unwrapData(sticker)
            let animation = try LottieAnimation.from(data: data)
            animationView.animation = animation
        } catch {
            print("Error: \(error)")
        }
        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AnimationView>) {
    }
}

extension AnimationView {
    
    private func unwrapData(_ sticker: Stickers) throws -> Data {
        guard let filePath = Bundle.main.path(forResource: sticker.name, ofType: sticker.type) else { throw AnimationError.animationNotFound }
        
        if let fileData = FileManager.default.contents(atPath: filePath) {
            if let unwrappedData = Zipper().gunzipData(fileData as NSData, 8 * 1024 * 1024) as? Data {
                return unwrappedData
            } else {
                throw AnimationError.dataNotFound
            }
        } else {
            throw AnimationError.dataNotFound
        }
    }
}
