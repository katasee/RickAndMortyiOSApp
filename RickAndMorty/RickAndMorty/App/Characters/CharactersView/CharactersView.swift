//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import SwiftUI

internal struct CharactersView: View {
    
    @ObservedObject private var viewModel: CharactersViewModel
    
    internal init(
        viewModel: CharactersViewModel
    ) {
        self.viewModel = viewModel
    }
    
    internal var body: some View {
        Group {
            if viewModel.update {
                VStack(alignment: .leading) {
                    Button {
                        viewModel.update = false
                    } label: {
                        Image(systemName: "arrowshape.backward")
                            .foregroundColor(.blue)
                            .padding()
                    }
                    if let url = viewModel.url {
                        RemoteWebView(
                            viewModel: .init(
                                url: .init(
                                    string: url
                                )
                            )
                        )
                    }
                }
                
            } else {
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
        }
        .task {
            do {
                try await viewModel.fetchData()
            } catch {
#warning("handle error properly")
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
