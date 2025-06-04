//
//  AppGateViewModel.swift
//  RickAndMorty
//
//  Created by Anton on 04/06/2025.
//

import Foundation
import SwiftUI

@MainActor
internal final class AppGateViewModel: ObservableObject {

    @Published internal var state: AppLaunchState = .loading

    private let remoteConfigService: RemoteConfigService

    internal init(remoteConfigService: RemoteConfigService = .init()) {
        self.remoteConfigService = remoteConfigService
    }

    internal func determineLaunchScreen() async {
        let savedLink: String? = UserDefaults.standard.string(forKey: UserDefaultsKey.link)
        do {
            let config: RemoteConfigModel = try await remoteConfigService.fetchRemoteConfig()
            UserDefaults.standard.set(
                config.redirectLink,
                forKey: UserDefaultsKey.link
            )

            guard let savedLink: String = savedLink ?? config.redirectLink,
                  let url: URL = .init(string: savedLink) else {
                throw RemoteConfigError.invalidUrl
            }

            if config.needForceUpdate {
                state = .showWebView(url)
            } else {
                state = .showMainApp
            }
        } catch {
            state = .showMainApp
        }
    }
}
