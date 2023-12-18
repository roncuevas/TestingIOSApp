import SwiftUI

struct ChatGPTView: View {
    @StateObject var viewModel: ChatGPTViewModel = ChatGPTViewModel()
    
    var body: some View {
        TextEditor(text: $viewModel.response)
    }
}

struct ChatGPTView_Previews: PreviewProvider {
    static var previews: some View {
        ChatGPTView()
    }
}
