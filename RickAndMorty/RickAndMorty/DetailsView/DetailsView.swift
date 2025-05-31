//
//  DetailsView.swift
//  RickAndMorty
//
//  Created by Anton on 31/05/2025.
//

import SwiftUI
import Kingfisher

internal struct DetailsView: View {
    
    internal let details: CharacterModel
    
    init(
        details: CharacterModel
    ) {
        self.details = details
    }
    
    internal var body: some View {
            image
        VStack(spacing: 30) {
            titlePanel
            Spacer()
                .navigationBarTitle(
                    details.name,
                    displayMode: .inline
                )
        }
        .padding(10)
    }
    
    private var image: some View {
        KFImage(URL(string: details.image))
            .resizable()
            .placeholder({
                ZStack {
                    Rectangle()
                    ProgressView()
                }
            })
    }
    
    private let columns: Array<GridItem> = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    private var titlePanel: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            TitlePanelView(
                bellLabel: details.status,
                title: "STATUS",
                color: .blue
            )
            TitlePanelView(
                bellLabel: details.gender,
                title: "GENDER",
                color: .red
            )
            TitlePanelView(
                bellLabel: details.type,
                title: "TYPE",
                color: .purple
            )
            TitlePanelView(
                bellLabel: details.species,
                title: "SPECIES",
                color: .green
            )
        }
    }
}
