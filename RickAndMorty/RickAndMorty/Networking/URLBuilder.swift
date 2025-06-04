//
//  URLBuilder.swift
//  RickAndMorty
//
//  Created by Anton on 04/06/2025.
//

import Foundation

internal struct URLBuilder {
    
    internal var baseURL: String
    internal var path: String?
    internal var queryItems: Array<URLQueryItem> = .init()
    
    internal func build() throws -> URL {
        guard var components: URLComponents = .init(string: baseURL) else {
            throw NetworkingError.invalidURL
        }
        
        if let path: String {
            components.path += path
        }
        
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        
        guard let url: URL = components.url else {
            throw NetworkingError.invalidURL
        }
        
        return url
    }
}
