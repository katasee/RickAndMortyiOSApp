//
//  TabBarView.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import SwiftUI

internal struct TabBarView: View {
    
    @State private var selection: String = "home"
    
    internal var body: some View {
        TabView(selection: $selection) {
            CharactersView(dataForAllCharacters: Card.mock())
                .tabItem {
                    Image(systemName: "person")
                    Text("Characters")
                }
            EpisodesView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Locations")
                }
            EpisodesView()
                .tabItem {
                    Image(systemName: "tv")
                    Text("Episodes")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    TabBarView()
}
