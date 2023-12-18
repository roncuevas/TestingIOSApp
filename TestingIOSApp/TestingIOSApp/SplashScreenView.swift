import SwiftUI

struct SplashScreenView: View {
        
    @State var animationFinished: Bool = false
    @State var isPresenting: Bool = false
    
    var body: some View {
        if animationFinished {
            NavigationManagerView(rootView: MainView())
        } else {
            LottieView(animationFinished: $animationFinished, name: "planets")
                .frame(width: 220, height: 220)
        }
    }
}
