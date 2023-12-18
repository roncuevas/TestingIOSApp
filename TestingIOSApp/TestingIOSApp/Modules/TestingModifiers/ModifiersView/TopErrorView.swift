import SwiftUI

struct TopErrorView: View {
    
    let title: String
    let message: String
    @Binding var showing: Bool
    
    @State var animating: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            if animating {
                HStack {
                    Spacer()
                    VStack {
                        Text(message)
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: proxy.size.width * 0.9)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.red)
                            )
                    }
                    Spacer()
                }
                .transition(.asymmetric(insertion: .opacity,
                                        removal: .slide))
            }
        }
        .onAppear {
            withAnimation {
                animating = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        animating = false
                    }
                }
            }
        }
    }
}

struct TopErrorView_Previews: PreviewProvider {
    static var previews: some View {
        TopErrorView(title: "My title", message: "My message", showing: Binding(get: {
            true
        }, set: { _ in
        }))
    }
}
