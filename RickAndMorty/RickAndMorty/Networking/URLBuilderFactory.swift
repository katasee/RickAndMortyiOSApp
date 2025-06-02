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
            baseURL: "https://rickandmortyapi.com",
              path: "/api/character"
        )
    }
}
