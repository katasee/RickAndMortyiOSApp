//
//  WebView.swift
//  RickAndMorty
//
//  Created by Anton on 01/06/2025.
//

import Foundation
import SwiftUI
import WebKit

internal struct WebView: UIViewRepresentable {
    
    @Binding internal var showLoader: Bool
    private var url: URL
    private var webView: WKWebView
    
    internal init(
        showLoader: Binding<Bool>,
        url: URL,
        webView: WKWebView
    ) {
        self._showLoader = showLoader
        self.url = url
        self.webView = webView
    }
    
    internal func makeUIView(context: Context) -> WKWebView {
        let request: URLRequest = .init(url: url)
        webView.navigationDelegate = context.coordinator
        webView.load(request)
        return webView
    }
    
    internal func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        //nope
    }
    
    internal func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(
            didStart: {
                showLoader = true
            }, didFinish: {
                showLoader = false
            }
        )
    }
}

internal class WebViewCoordinator: NSObject, WKNavigationDelegate {
    
    private var didStart: () -> Void
    private var didFinish: () -> Void
    
    internal init(
        didStart: @escaping () -> Void,
        didFinish: @escaping () -> Void
    ) {
        self.didStart = didStart
        self.didFinish = didFinish
    }
    
    internal func webView(
        _ webView: WKWebView,
        didStartProvisionalNavigation navigation: WKNavigation!
    ) {
        didStart()
    }
    
    internal func webView(
        _ webView: WKWebView,
        didFinish navigation: WKNavigation!
    ) {
        didFinish()
    }
    
    internal func webView(
        _ webView: WKWebView,
        didFail navigation: WKNavigation!,
        withError error: any Error
    ) {
#warning("handle error properly")
    }
}
