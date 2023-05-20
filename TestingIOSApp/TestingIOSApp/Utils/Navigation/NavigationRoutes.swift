//
//  NavigationRoutes.swift
//  iOS_Testing
//
//  Created by Aarón Alberto Martínez Cuevas on 09/04/23.
//

import Foundation
import SwiftUI

enum NavigationRoute: Hashable {
    case splashScreenView
    case mainView
    case randomUserView
    case randomUserSavedView
    case testingModifiers
    case carouselView
    
    func associatedView() -> AnyView {
        switch self {
        case .splashScreenView:
            return AnyView(SplashScreenView())
        case .mainView:
            return AnyView(MainView())
        case .randomUserView:
            return AnyView(RandomUserView())
        case .randomUserSavedView:
            return AnyView(RandomUsersSavedView())
        case .testingModifiers:
            return AnyView(TestingModifiers())
        case .carouselView:
            return AnyView(CarouselView())
        }
    }
}
