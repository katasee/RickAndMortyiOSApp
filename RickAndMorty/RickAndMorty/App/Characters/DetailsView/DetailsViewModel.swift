//
//  DetailsViewModel.swift
//  RickAndMorty
//
//  Created by Anton on 04/06/2025.
//

import Foundation
import WebKit

internal final class DetailsViewModel: ObservableObject, @unchecked Sendable {
    
    @Published internal var details: CharacterModel?
    @Published internal var errorMessage: String? = nil
    
    private let webService: WebService
    private let id: Int
    
    internal init(
        id: Int,
        webService: WebService = .init()
    ) {
        self.id = id
        self.webService = webService
    }
    
    internal func loadCharacter() async {
        do {
            let response: Character = try await webService.fetch(
                from: URLBuilderFactory.character(by: id)
            )
            
            await MainActor.run { [weak self] in
                self?.details = response.mapToCharacterModel()
            }
        } catch {
            await MainActor.run { [weak self] in
                self?.errorMessage = "Failed to load character details. Please try again."
            }
        }
    }
}
