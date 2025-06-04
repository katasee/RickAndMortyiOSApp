//
//  AppLaunchState.swift
//  RickAndMorty
//
//  Created by Anton on 04/06/2025.
//

import Foundation

internal enum AppLaunchState {

    case loading
    case showWebView(URL?)
    case showMainApp
}
