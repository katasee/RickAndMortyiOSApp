//
//  RemoteWebView.swift
//  RickAndMorty
//
//  Created by Anton on 02/06/2025.
//

import SwiftUI

internal struct RemoteWebView: View {
    
    @ObservedObject private var viewModel: RemoteWebViewModel
    
    internal init(viewModel: RemoteWebViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    internal var body: some View {
        if let url: URL = viewModel.url {
            WebView(
                showLoader: $viewModel.isLoading,
                url: url,
                webView: viewModel.webView,
                onError: { _ in
                    viewModel.errorMessage = "Something went wrong while loading the page."
                }
            )
            .overlay(
                Group {
                    if viewModel.isLoading {
                        Loader()
                    }
                }
            )
            .errorAlert(
                title: "WebView Error",
                message: $viewModel.errorMessage,
                buttonTitle: "Dismiss",
                retryTitle: "Try Again",
                retryAction: {
                    viewModel.refresh()
                }
            )
        }
        HStack {
            if viewModel.webView.canGoBack {
                Button {
                    Task {
                        viewModel.navigateBack()
                    }
                } label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            Spacer()
            Button {
                Task {
                    viewModel.refresh()
                }
            } label: {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(.blue)
                    .padding()
            }
        }
    }
}
