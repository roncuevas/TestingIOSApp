//
//  WebView.swift
//  TestingIOSApp
//
//  Created by Aarón Martínez Cuevas on 27/08/23.
//

import SwiftUI
import Foundation
import WebKit

struct WebView: UIViewRepresentable {
    @Binding var webView: WKWebView
    let url: String
    
    func makeUIView(context: Context) -> some UIView {
        guard let url = URL(string: url) else { return webView }
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
