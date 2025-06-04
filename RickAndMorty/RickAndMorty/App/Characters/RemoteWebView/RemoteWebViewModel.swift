//
//  RemoteWebViewModel.swift
//  RickAndMorty
//
//  Created by Anton on 02/06/2025.
//

import Foundation
import WebKit

@MainActor
final class RemoteWebViewModel: ObservableObject {
    
    @Published internal var isLoading: Bool = false
    @Published internal var errorMessage: String?
    internal let webView: WKWebView
    internal let url: URL?
    
    internal init(
        url: URL?,
        webView: WKWebView = .init()
    ) {
        self.url = url
        self.webView = WKWebView()
    }
    
    internal func navigateBack() {
        webView.goBack()
    }
    
    internal func refresh() {
        webView.reload()
    }
}
