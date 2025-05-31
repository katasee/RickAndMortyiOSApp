//
//  CharactersMock.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import Foundation

extension DetailCard {
    internal static func mock() -> DetailCard {
        DetailCard(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            gender: "Male",
            type: "None",
            species: "Human",
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
         )
    }
}
