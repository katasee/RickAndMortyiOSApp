//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import Foundation

internal struct Card: Identifiable, Sendable, Equatable {
    
    let id: Int
    let name: String
    let status: String
    let image: String
    
    internal init(
        id: Int,
        name: String,
        status: String,
        image: String
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.image = image
    }
}
