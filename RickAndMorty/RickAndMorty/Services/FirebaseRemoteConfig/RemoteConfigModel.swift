//
//  RemoteConfigModel.swift
//  RickAndMorty
//
//  Created by Anton on 04/06/2025.
//

import Foundation

internal struct RemoteConfigModel: Sendable {
    
    internal let needForceUpdate: Bool
    internal let redirectLink: String?
    
    internal init(
        needForceUpdate: Bool,
        redirectLink: String? = nil
    ) {
        self.needForceUpdate = needForceUpdate
        self.redirectLink = redirectLink
    }
}
