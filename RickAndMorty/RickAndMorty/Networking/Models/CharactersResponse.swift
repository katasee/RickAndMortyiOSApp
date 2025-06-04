//
//  CharactersResponse.swift
//  RickAndMorty
//
//  Created by Anton on 31/05/2025.
//

import Foundation

internal struct CharacterResponse: Decodable, Sendable {
    
    internal let info: Info?
    internal let results: Array<Character>?
}

internal struct Info: Decodable, Sendable {
    
    internal let count: Int?
    internal let pages: Int?
    internal let next: String?
    internal let prev: String?
}

internal struct Character: Decodable, Sendable {
    
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

internal struct Origin: Decodable, Sendable {
    
    internal let name: String?
    internal let url: String?
}

internal struct Location: Decodable, Sendable {
    
    internal let name: String?
    internal let url: String?
}
