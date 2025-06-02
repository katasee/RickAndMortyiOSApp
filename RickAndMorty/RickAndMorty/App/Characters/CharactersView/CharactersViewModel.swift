//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import Foundation
import WebKit

internal final class CharactersViewModel: ObservableObject {
    
    @Published internal var dataForCharactersView: Array<CharacterModel> = .init()
    @Published internal var url: String?
    @Published internal var update: Bool = false
    private let webService: WebService = .init()
    internal let remoteConfigService: RemoteConfigService
    
    internal init(remoteConfigService: RemoteConfigService) {
        self.remoteConfigService = remoteConfigService
    }
    
    internal func fetchData() async  {
        do {
            let needForceUpdate = try await remoteConfigService.fetchRemoteConfig().0
            if let savedLink: String = UserDefaults.standard.string(forKey: "link") {
                await MainActor.run { [weak self] in
                    self?.url = savedLink
                    self?.update = needForceUpdate
                }
            } else {
                let (needForceUpdate, link) = try await remoteConfigService.fetchRemoteConfig()
                UserDefaults.standard.set(link, forKey: "link")
                await MainActor.run { [weak self] in
                    self?.url = link
                    self?.update = needForceUpdate
                }
            }
        } catch {
        #warning("handle error properly")
        }
    }
    
    internal func prepeareDataForCharactersView() async throws -> Array<CharacterModel> {
        let response: CharacterResponse = try await WebService().fetch(
            from: URLBuilderFactory.characters()
        )
        let characterForUI: Array<CharacterModel> = response.results?
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
