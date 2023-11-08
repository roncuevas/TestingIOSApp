import Foundation
import SwiftUI

enum NavigationRoute: Hashable {
    case splashScreenView
    case mainView
    case randomUserView
    case randomUserSavedView
    case testingModifiers
    case carouselView
    case scrappingView
    
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
        case .scrappingView:
            return AnyView(ScrappingView())
        }
    }
}
