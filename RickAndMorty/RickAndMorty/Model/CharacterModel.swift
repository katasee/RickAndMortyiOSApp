//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

internal struct CharacterModel: Identifiable, Sendable, Equatable {
    
    let id: Int
    let name: String
    let status: String
    let gender: String
    let type: String
    let species: String
    let image: String
    
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
