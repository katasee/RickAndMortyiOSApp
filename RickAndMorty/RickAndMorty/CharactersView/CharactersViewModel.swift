//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import Foundation

internal final class CharactersViewModel: ObservableObject {
    
    @Published internal var dataForCharactersView: Array<CharacterModel> = .init()
    
    internal func prepeareDataForCharactersView() async throws -> Array<CharacterModel> {
        let response: CharacterResponse = try await WebService().getCharacters()
        let characterForUI: Array<CharacterModel> = response.results?
            .compactMap { cardDetails in
                guard let id = cardDetails.id,
                      let name = cardDetails.name,
                      let status = cardDetails.status,
                      let gender = cardDetails.gender,
                      let type = cardDetails.type,
                      let species = cardDetails.species,
                      let image = cardDetails.image
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
        return characterForUI
    }
    
    internal func loadCharacters() async {
        do {
            let charactersData: [CharacterModel] = try await prepeareDataForCharactersView()
            await MainActor.run { [weak self] in
                self?.dataForCharactersView = charactersData
            }
        } catch {
            print(error)
        }
    }
}
