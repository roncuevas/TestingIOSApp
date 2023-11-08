import Foundation
import WebKit

protocol MessageHandlerDelegate: AnyObject {
    func stringReceiver(string: String)
    func dataReceiver(data: Data)
}

class ScrappingViewModel: ObservableObject, MessageHandlerDelegate {
    @Published var captchaURL = ""
    @Published var imageData: Data?
    var handler: MessageHandler
    var webView: WKWebView
    
    init() {
        handler = MessageHandler()
        
        let userContentController = WKUserContentController()
        userContentController.add(handler, name: "myNativeApp")
        
        let webViewConfiguration = WKWebViewConfiguration()
        webViewConfiguration.userContentController = userContentController
        
        self.webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        handler.delegate = self
    }
    
    func stringReceiver(string: String) {
        
    }
    
    func dataReceiver(data: Data) {
        imageData = data
    }
}

class MessageHandler: NSObject, WKScriptMessageHandler {
    weak var delegate: MessageHandlerDelegate?
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let message = message.body as? String {
            guard let delegate = delegate else { return }
            if message.components(separatedBy: ":")[0].contains("CaptchaImage") {
                guard let dataReady = message.replacingOccurrences(of: "CaptchaImage:", with: "").convertDataURIToData() else { return }
                delegate.dataReceiver(data: dataReady)
            }
        }
    }
}

extension String {
    func convertDataURIToData() -> Data? {
        if let commaIndex = self.range(of: ",") {
            let base64String = self.suffix(from: commaIndex.upperBound)
            return Data(base64Encoded: String(base64String))
        }
        return nil
    }
}
