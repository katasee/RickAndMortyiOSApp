//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Anton on 04/06/2025.
//

import Foundation

extension CharacterResponse {
    
    internal func mapToCardDetails() -> Array<CharacterModel> {
        results?
            .compactMap { cardDetails in
                guard let id: Int = cardDetails.id,
                      let name: String = cardDetails.name,
                      let status: String = cardDetails.status,
                      let gender: String = cardDetails.gender,
                      let type: String = cardDetails.type,
                      let species: String = cardDetails.species,
                      let image: String = cardDetails.image
                else {
                    return nil
                }
                return .init(
                    id: id,
                    name: name,
                    status: status,
                    gender: gender,
                    type: type,
                    species: species,
                    image: image
                )
            } ?? .init()
    }
}

extension Character {
    
    internal func mapToCharacterModel() -> CharacterModel? {
        guard let id: Int,
              let name: String,
              let status: String,
              let gender: String,
              let type: String,
              let species: String,
              let image: String else {
            return nil
        }
        
        return CharacterModel(
            id: id,
            name: name,
            status: status,
            gender: gender,
            type: type,
            species: species,
            image: image
        )
    }
}
