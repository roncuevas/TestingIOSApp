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
    
    func associatedView() -> AnyView {
        switch self {
        case .splashScreenView:
            return AnyView(SplashScreenView())
        case .mainView:
            return AnyView(MainView())
        }
    }
}
