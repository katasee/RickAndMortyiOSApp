//
//  NetworkingError.swift
//  RickAndMorty
//
//  Created by Anton on 04/06/2025.
//

import Foundation

internal enum NetworkingError: Error {
    
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidStatusCode(Int)
}
