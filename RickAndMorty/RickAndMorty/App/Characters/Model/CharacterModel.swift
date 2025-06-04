//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

internal struct CharacterModel: Identifiable, Sendable, Equatable {
    
    internal let id: Int
    internal let name: String
    internal let status: String
    internal let gender: String
    internal let type: String
    internal let species: String
    internal let image: String
    
    internal init(
        id: Int,
        name: String,
        status: String,
        gender: String,
        type: String,
        species: String,
        image: String
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.gender = gender
        self.type = type
        self.species = species
        self.image = image
    }
}
