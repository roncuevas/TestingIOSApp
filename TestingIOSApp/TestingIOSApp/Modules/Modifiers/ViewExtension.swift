import Foundation
import SwiftUI

extension View {
    func addLoader(show: Binding<Bool>, frame: CGSize = CGSize(width: 100, height: 100)) -> some View {
        modifier(LoaderView(show: show, frame: frame))
    }
    
    func addErrorAlert(showing: Binding<Bool>, title: String, message: String) -> some View {
        modifier(ErrorView(showing: showing, title: title, message: message))
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

struct ErrorView: ViewModifier {
    @Binding var showing: Bool
    let title: String
    let message: String
    
    func body(content: Content) -> some View {
        
        ZStack {
            content
            if $showing.wrappedValue {
                TopErrorView(title: title, message: message, showing: $showing)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            showing = false
                        }
                    }
            }
        }
    }
}
