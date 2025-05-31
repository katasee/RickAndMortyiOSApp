//
//  CharactersResponse.swift
//  RickAndMorty
//
//  Created by Anton on 31/05/2025.
//

import Foundation

internal struct CharacterResponse: Codable {
    
    internal let info: Info?
    internal let results: Array<CharacterResults>?
}

internal struct Info: Codable {
    
    internal let count: Int?
    internal let pages: Int?
    internal let next: String?
    internal let prev: String?
}

internal struct CharacterResults: Codable {
    
    internal let id: Int?
    internal let name: String?
    internal let status: String?
    internal let species: String?
    internal let type: String?
    internal let gender: String?
    internal let origin: Origin?
    internal let location: Location?
    internal let image: String?
    internal let episode: Array<String>?
    internal let url: String?
    internal let created: String?
}

internal struct Origin: Codable {
    
    internal let name: String?
    internal let url: String?
}

internal struct Location: Codable {
    
    internal let name: String?
    internal let url: String?
}
