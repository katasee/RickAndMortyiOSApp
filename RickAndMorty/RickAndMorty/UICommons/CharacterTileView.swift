//
//  CharacterTileView.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import SwiftUI
import Kingfisher

internal struct CharacterTileView: View {
    
    internal let card: CharacterModel
    
    internal var body: some View {
        VStack(alignment: .leading) {
            cardImage
            VStack(alignment: .leading) {
                cardTitle
                cardStatus
            }
            .padding(5)
        }
        .background(Color.white)
        .cornerRadius(5)
        .shadow(
            color: Color.black.opacity(0.3),
            radius: 5,
            x: -5,
            y: 5
        )
    }
    
    private var cardImage: some View {
        KFImage(URL(string: card.image))
            .placeholder ({
                ProgressView()
            })
            .resizable()
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .aspectRatio(contentMode: .fill)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondary.opacity(0.3))
            )
    }
    
    private var cardTitle: some View {
        Text(card.name)
            .bold()
            .foregroundColor(.black)
            .lineLimit(1)
    }
    
    private var cardStatus: some View {
        Text("Status: \(card.status)")
            .font(.subheadline)
            .foregroundColor(.gray)
    }
}
