//
//  DetailsView.swift
//  RickAndMorty
//
//  Created by Anton on 31/05/2025.
//

import SwiftUI
import Kingfisher

internal struct DetailsView: View {

    @ObservedObject private var viewModel: DetailsViewModel

    internal init(viewModel: DetailsViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    internal var body: some View {
        Group {
            if let details: CharacterModel = viewModel.details {
                VStack {
                    image(url: details.image)
                    VStack(spacing: 30) {
                        titlePanel(using: details)
                        Spacer()
                            .navigationBarTitle(
                                details.name,
                                displayMode: .inline
                            )
                    }
                    .padding(10)
                }
            } else {
                ProgressView("Loading...")
            }

        }
        .errorAlert(
            title: "Error",
            message: $viewModel.errorMessage,
            buttonTitle: "Dismiss",
            retryTitle: "Try Again",
            retryAction: {
                Task {
                    await viewModel.loadCharacter()
                }
            }
        )
        .task {
            await viewModel.loadCharacter()
        }
    }
    
    private func image(url: String) -> some View {
        KFImage(URL(string: url))
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
    
    private func titlePanel(using details: CharacterModel) -> some View {
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
                bellLabel: details.type.isEmpty ? "None": details.type,
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
