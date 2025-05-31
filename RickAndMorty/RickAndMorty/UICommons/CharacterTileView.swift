//
//  CharacterTileView.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import SwiftUI
import Kingfisher

internal struct CharacterTileView: View {
    
    internal let card: Card
    
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
                ZStack {
                    Rectangle()
                    ProgressView()
                }
            })
            .resizable()
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .aspectRatio(contentMode: .fill)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondary)
            )
    }
    
    private var cardTitle: some View {
        Text("Rick Sanchez")
            .bold()
            .foregroundColor(.black)
    }
    
    private var cardStatus: some View {
        Text("Status: alive")
            .font(.subheadline)
            .foregroundColor(.gray)
    }
}
