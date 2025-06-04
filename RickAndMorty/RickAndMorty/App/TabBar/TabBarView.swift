//
//  TabBarView.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import SwiftUI

internal enum Tab {
    
    case home
    case locations
    case setting
    case episodes
}

internal struct TabBarView: View {
    
    @ObservedObject private var viewModel: TabBarViewModel
    
    internal init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel
    }
    
    internal var body: some View {
        TabView(selection: $viewModel.currentTab) {
            CharactersView(viewModel: CharactersViewModel())
                .tabItem {
                    Image(systemName: "person")
                        .id(Tab.home)
                }
            LocationsView()
                .tabItem {
                    Image(systemName: "globe")
                        .id(Tab.locations)
                }
            EpisodesView()
                .tabItem {
                    Image(systemName: "tv")
                        .id(Tab.episodes)
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                        .id(Tab.setting)
                }
        }
    }
}
