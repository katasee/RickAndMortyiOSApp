//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Anton on 30/05/2025.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            return true
        }
}

@main
struct RickAndMortyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    internal var body: some Scene {
        WindowGroup {
            TabBarView(viewModel: TabBarViewModel())
        }
    }
}
