//
//  RemoteConfigService.swift
//  RickAndMorty
//
//  Created by Anton on 01/06/2025.
//

import Foundation
import FirebaseRemoteConfig

internal final class RemoteConfigService: NSObject {
    
    private lazy var remoteConfig: RemoteConfig = {
        let rc: RemoteConfig = RemoteConfig.remoteConfig()
        let settings: RemoteConfigSettings = .init()
        settings.minimumFetchInterval = 0
        rc.configSettings = settings
        return rc
    }()
    
    private enum RemoteConfigKey {
        static let needForceUpdate = "needForceUpdate"
        static let redirectLink = "redirectLink"
    }
    
    internal func fetchRemoteConfig() async throws -> (Bool, String?) {
        let config: RemoteConfigFetchAndActivateStatus = try await remoteConfig.fetchAndActivate()
        switch config {
        case .successFetchedFromRemote:
            let update = remoteConfig.configValue(forKey: RemoteConfigKey.needForceUpdate).boolValue
            let link = remoteConfig.configValue(forKey: RemoteConfigKey.redirectLink).stringValue
            return (update, link)
        case .successUsingPreFetchedData:
            let update = remoteConfig.configValue(forKey: RemoteConfigKey.needForceUpdate).boolValue
            return (update, nil)
        default:
            return(false, nil)
        }
    }
}
