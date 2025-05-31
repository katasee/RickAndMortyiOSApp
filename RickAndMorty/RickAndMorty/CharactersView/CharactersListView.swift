//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import SwiftUI

internal struct CharactersView: View {
    
    private let dataForAllCharacters: Array<Card>
    
    internal init(dataForAllCharacters: Array<Card>) {
        self.dataForAllCharacters = dataForAllCharacters
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
            ForEach(dataForAllCharacters, id: \.id) { card in
                NavigationLink(destination: DetailsView(details: DetailCard.mock())
                ){
                    CharacterTileView(card: card)
                }
            }
        }
    }
}

#Preview {
    CharactersView(dataForAllCharacters: Card.mock())
}
