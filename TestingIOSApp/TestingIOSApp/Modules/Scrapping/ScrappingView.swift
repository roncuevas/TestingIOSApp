import Foundation
import SwiftUI
import WebKit
import Kingfisher

struct ScrappingView: View {
    @State private var captchaImage: UIImage?
    @ObservedObject private var viewModel = ScrappingViewModel()
    @State var boleta: String = ""
    @State var password: String = ""
    @State var captcha: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            WebView(webView: $viewModel.webView, url: ScrappingConstants.enmh)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        let javascript = """
                            var captchaImage = documen.getElementById('c_default_ctl00_leftcolumn_loginuser_logincaptcha_CaptchaImage');
                            var captchaSource = captchaImage.src;
                            var canvas = document.createElement("canvas");
                            var contexto = canvas.getContext("2d");
                            canvas.width = captchaImage.width;
                            canvas.height = captchaImage.height;
                            contexto.drawImage(captchaImage, 0, 0);
                            document.body.appendChild(canvas);
                            var datosDeImagen = canvas.toDataURL("image/jpeg");
                            var isLogged = captchaImage ? false : true
                            window.webkit.messageHandlers.myNativeApp.postMessage("CaptchaImage:" + datosDeImagen);
                            """
                        viewModel.webView.evaluateJavaScript(javascript)
                    }
                }
            Text("Boleta")
            TextField(text: $boleta) {
                Text("Boleta")
            }
            Text("Contraseña")
            SecureField("Password", text: $password)
            Text("Captcha")
            if let imageData = viewModel.imageData {
                Image(uiImage: UIImage(data: imageData)!)
            }
            if let captchaURL = URL(string: viewModel.captchaURL) {
                KFImage(captchaURL)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            TextField(text: $captcha) {
                Text("Captcha")
            }
            Button {
                let javascript = """
                    var userElement = document.getElementById('ctl00_leftColumn_LoginUser_UserName');
                    userElement.value = "\(boleta)"
                    var passwordElement = document.getElementById('ctl00_leftColumn_LoginUser_Password');
                    passwordElement.value = "\(password)"
                    var captchaElement = document.getElementById('ctl00_leftColumn_LoginUser_CaptchaCodeTextBox');
                    captchaElement.value = "\(captcha)"
                    var loginButton = document.getElementById('ctl00_leftColumn_LoginUser_LoginButton');
                    loginButton.click();
                    """
                viewModel.webView.evaluateJavaScript(javascript)
            } label: {
                Text("Login")
            }
        }
    }
}
