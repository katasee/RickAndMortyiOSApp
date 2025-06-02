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
                webView: viewModel.webView
            )
            .overlay(
                Group {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
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
