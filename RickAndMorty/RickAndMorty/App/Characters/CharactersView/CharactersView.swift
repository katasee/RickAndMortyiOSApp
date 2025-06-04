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
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    title
                    allCards
                        .padding(.bottom, 10)
                }
            }
            .task {
                await viewModel.loadCharacters()
            }
        }
        .errorAlert(
            title: "Error",
            message: $viewModel.errorMessage,
            buttonTitle: "Dismiss",
            retryTitle: "Try Again",
            retryAction: {
                Task {
                    await viewModel.loadCharacters()
                }
            }
        )
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
    
    @ViewBuilder
    private var allCards: some View {
        if viewModel.isLoading {
            ZStack {
                Color.clear.ignoresSafeArea()
                Loader()
            }
        } else {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.dataForCharactersView, id: \.id) { card in
                    NavigationLink(
                        destination: DetailsView(
                            viewModel: DetailsViewModel(id: card.id)
                        )
                    ) {
                        CharacterTileView(card: card)
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }
}
