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
    private let url: URL
    private let webView: WKWebView
    private let onError: (Error) -> Void
    
    internal init(
        showLoader: Binding<Bool>,
        url: URL,
        webView: WKWebView,
        onError: @escaping (Error) -> Void
    ) {
        self._showLoader = showLoader
        self.url = url
        self.webView = webView
        self.onError = onError
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
            }, onError: { error in
                onError(error)
            }
        )
    }
}

internal class WebViewCoordinator: NSObject, WKNavigationDelegate {
    
    private var didStart: () -> Void
    private var didFinish: () -> Void
    private var onError: (Error) -> Void
    
    internal init(
        didStart: @escaping () -> Void,
        didFinish: @escaping () -> Void,
        onError: @escaping (Error) -> Void
    ) {
        self.didStart = didStart
        self.didFinish = didFinish
        self.onError = onError
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
        onError(error)
    }
}
