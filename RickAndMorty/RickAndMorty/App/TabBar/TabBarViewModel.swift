//
//  TabBarViewModel.swift
//  RickAndMorty
//
//  Created by Anton on 03/06/2025.
//

import Foundation

final class TabBarViewModel: ObservableObject {
    
    @Published internal var currentTab: Tab = .home
}
