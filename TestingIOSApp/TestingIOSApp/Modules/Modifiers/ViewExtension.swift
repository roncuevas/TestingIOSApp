//
//  ViewExtension.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 12/04/23.
//

import Foundation
import SwiftUI

extension View {
    func addLoader(show: Binding<Bool>, frame: CGSize) -> some View {
        modifier(LoaderView(show: show, frame: frame))
    }
}

struct LoaderView: ViewModifier {
    let show: Binding<Bool>
    let frame: CGSize
    
    @State private var animationFinished: Bool = true
        
    func body(content: Content) -> some View {
        ZStack {
            content
            if show.wrappedValue {
                LottieView(animationFinished: $animationFinished, name: RandomUserConstants.loaderName, loopMode: .loop)
                    .frame(width: frame.width, height: frame.height)
            }
        }
    }
}
