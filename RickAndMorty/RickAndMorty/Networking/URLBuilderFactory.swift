//
//  URLBuilderFactory.swift
//  RickAndMorty
//
//  Created by Anton on 04/06/2025.
//

import Foundation

internal enum URLBuilderFactory {
    
    internal static func characters() -> URLBuilder {
        .init(
            baseURL: Constants.baseURL,
            path: "/api/character"
        )
    }
    
    internal static func character(by id: Int) -> URLBuilder {
        .init(
            baseURL: Constants.baseURL,
            path: "/api/character/\(id)"
        )
    }
}
