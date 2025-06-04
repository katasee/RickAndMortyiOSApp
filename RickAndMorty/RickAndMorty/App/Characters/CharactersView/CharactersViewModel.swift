//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import Foundation
import WebKit

internal final class CharactersViewModel: ObservableObject, @unchecked Sendable {
    
    @Published internal var dataForCharactersView: Array<CharacterModel> = .init()
    @Published internal var url: String?
    @Published internal var update: Bool = false
    @Published internal var isLoading: Bool = false
    @Published internal var errorMessage: String? = nil
    
    private let webService: WebService
    
    internal init(webService: WebService = .init()) {
        self.webService = webService
    }
    
    internal func loadCharacters() async {
        do {
            await MainActor.run { [weak self] in
                self?.isLoading = true
            }
            
            let response: CharacterResponse = try await webService.fetch(
                from: URLBuilderFactory.characters()
            )
            let charactersData: Array<CharacterModel> = response.mapToCardDetails()
            
            await MainActor.run { [weak self] in
                self?.dataForCharactersView = charactersData
                self?.isLoading = false
            }
        } catch {
            await MainActor.run { [weak self] in
                self?.isLoading = false
                self?.errorMessage = "Failed to load characters. Please try again."
            }
        }
    }
}
