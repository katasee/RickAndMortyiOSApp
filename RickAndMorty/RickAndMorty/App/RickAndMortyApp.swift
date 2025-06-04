//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import SwiftUI
import Firebase

@main
struct RickAndMortyApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var appGate: AppGateViewModel = .init()
    
    internal var body: some Scene {
        WindowGroup {
            Group {
                switch appGate.state {
                case .loading:
                    ProgressView("Loading...")
                case let .showWebView(url):
                    VStack(alignment: .leading) {
                        Button {
                            appGate.state = .showMainApp
                        } label: {
                            Image(systemName: "arrowshape.backward")
                                .foregroundColor(.blue)
                                .padding()
                        }
                        RemoteWebView(
                            viewModel: .init(
                                url: url
                            )
                        )
                    }
                case .showMainApp:
                    TabBarView(viewModel: TabBarViewModel())
                }
            }
            .task {
                await appGate.determineLaunchScreen()
            }
        }
    }
}
