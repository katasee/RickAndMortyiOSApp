//
//  Network.swift
//  RickAndMorty
//
//  Created by Anton on 31/05/2025.
//

import Foundation

internal final class WebService {
    
    internal enum NetworkingError: Error {
        case invalidURL
        case invalidResponse
        case invalidData
        case invalidStatusCode
    }
    
    internal func getCharacters() async throws -> CharacterResponse {
        let endpoint = "https://rickandmortyapi.com/api/character"
        
        guard let url = URL(string: endpoint) else {
            throw NetworkingError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let respone: HTTPURLResponse = response as? HTTPURLResponse else {
            throw NetworkingError.invalidResponse
        }
        guard respone.statusCode == 200 else {
            throw NetworkingError.invalidStatusCode
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(
                CharacterResponse.self,
                from: data
            )
        } catch {
            throw NetworkingError.invalidData
        }
    }
}
