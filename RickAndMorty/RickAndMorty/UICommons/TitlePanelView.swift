//
//  TitlePanelView.swift
//  RickAndMorty
//
//  Created by Anton on 31/05/2025.
//

import SwiftUI

internal struct TitlePanelView: View {
    
    internal let bellLabel: String
    internal let title: String
    internal let color: Color
    
    internal var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "bell")
                    .foregroundColor(color)
                Text(bellLabel)
            }
            .padding(20)
            Spacer()
            Text(title)
                .foregroundColor(color)
                .frame(width: 190, height: 40)
                .background(Color(UIColor.secondarySystemBackground))
                .foregroundColor(.white)
                .cornerRadius(5)
        }
    }
}
