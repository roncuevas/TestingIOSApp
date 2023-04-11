//
//  LottieView.swift
//  iOS_Testing
//
//  Created by Aarón Alberto Martínez Cuevas on 09/04/23.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    @Binding var animationFinished: Bool
    var name: String
    var loopMode: LottieLoopMode = .playOnce
    
    var animationView = LottieAnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = LottieAnimation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play { finished in
            withAnimation {
                animationFinished = true
            }
        }
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
}
