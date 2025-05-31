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
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image(systemName: "bell")
                    .foregroundColor(color)
                Text(bellLabel)
            }
            .padding(20)

            Text(title)
                .foregroundColor(color)
                .frame(width: 200, height: 40)
                .background(Color(UIColor.secondarySystemBackground))
                .foregroundColor(.white)
                .cornerRadius(5)
        }
    }
}

#Preview {
    TitlePanelView(bellLabel: "Dead", title: "STATUS", color: .blue)
}
