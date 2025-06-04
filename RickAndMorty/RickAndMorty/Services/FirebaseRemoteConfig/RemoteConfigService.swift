//
//  RemoteConfigService.swift
//  RickAndMorty
//
//  Created by Anton on 01/06/2025.
//

import Foundation
import FirebaseRemoteConfig

internal final class RemoteConfigService: NSObject, @unchecked Sendable {
    
    private lazy var remoteConfig: RemoteConfig = {
        let rc: RemoteConfig = RemoteConfig.remoteConfig()
        let settings: RemoteConfigSettings = .init()
        settings.minimumFetchInterval = 0
        rc.configSettings = settings
        return rc
    }()
    
    internal func fetchRemoteConfig() async throws -> RemoteConfigModel {
        let config: RemoteConfigFetchAndActivateStatus = try await remoteConfig.fetchAndActivate()
        switch config {
        case .successFetchedFromRemote:
            let needForceUpdate: Bool = remoteConfig.configValue(forKey: RemoteConfigKey.needForceUpdate).boolValue
            let redirectLink: String? = remoteConfig.configValue(forKey: RemoteConfigKey.redirectLink).stringValue
            
            return RemoteConfigModel(
                needForceUpdate: needForceUpdate,
                redirectLink: redirectLink
            )
        case .successUsingPreFetchedData:
            let needForceUpdate: Bool = remoteConfig.configValue(forKey: RemoteConfigKey.needForceUpdate).boolValue
            
            return RemoteConfigModel(needForceUpdate: needForceUpdate)
        default:
            return RemoteConfigModel(needForceUpdate: false)
        }
    }
}
