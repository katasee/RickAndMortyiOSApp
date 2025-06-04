//
//  Loader.swift
//  RickAndMorty
//
//  Created by Anton on 04/06/2025.
//

import SwiftUI

struct Loader: View {
    var body: some View {
        ProgressView("Loading...")
            .progressViewStyle(CircularProgressViewStyle())
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

#Preview {
    Loader()
}
