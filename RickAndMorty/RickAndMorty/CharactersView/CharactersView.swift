//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import SwiftUI

internal struct CharactersView: View {
    
    @StateObject private var viewModel: CharactersViewModel

    internal init(
        viewModel: CharactersViewModel
    ) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    internal var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    title
                    allCards
                }
            }
            .padding(10)
            .task {
                await viewModel.loadCharacters()
            }
        }
    }
    
    private var title: some View {
        Text("Characters")
            .font(.largeTitle)
            .bold()
            .padding(.leading, 10)
    }
    
    private let columns: Array<GridItem> = [
        GridItem(
            .flexible(),
            spacing: 10
        ),
        GridItem(.flexible())
    ]
    
    private var allCards: some View {
        LazyVGrid(columns: columns) {
            ForEach(viewModel.dataForCharactersView, id: \.id) { card in
                NavigationLink(destination: DetailsView(
                    details: CharacterModel(
                        id: card.id,
                        name: card.name,
                        status: card.status,
                        gender: card.gender,
                        type: card.type,
                        species: card.species,
                        image: card.image
                    ))
                ) {
                    CharacterTileView(card: card)
                }
            }
        }
    }
}
