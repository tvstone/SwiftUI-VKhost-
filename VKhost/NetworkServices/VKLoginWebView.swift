//
//  VKLoginWebView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 09.12.2021.
//

import SwiftUI
import WebKit

struct VKLoginWebView: UIViewRepresentable {
    
    fileprivate let navigationDelegate : WebViewNavigationDelegate
    
    init (isLogin : Binding<Bool>) {
        self.navigationDelegate = WebViewNavigationDelegate(isLogin: isLogin)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = navigationDelegate
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
    }
    
    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [URLQueryItem(name: "client_id", value: Session.shared.cliendId),
                                 URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                                 URLQueryItem(name: "display", value: "mobile"),
                                 URLQueryItem(name: "scope", value: "270342"),
                                 URLQueryItem(name: "response_type", value: "token"),
                                 URLQueryItem(name: "v", value: Session.shared.version)]
        return components.url.map { URLRequest(url: $0) }
    }
}

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    
    @Binding var isLogin : Bool
    
    init(isLogin : Binding<Bool>) {
        self._isLogin = isLogin
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
                  decisionHandler(.allow)
                  return
              }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let token = params["access_token"],
              let userIdString = params["user_id"],
              let _ = Int(userIdString)
        else {
            decisionHandler(.allow)
            return
        }
        Session.shared.token = token
        Session.shared.userId = userIdString
        print(" Token  = \(token)")
        isLogin = true
        decisionHandler(.cancel)
    }
}
