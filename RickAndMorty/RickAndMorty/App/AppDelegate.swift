//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Anton on 04/06/2025.
//

import Foundation
import UIKit
import FirebaseCore

internal final class AppDelegate: NSObject, UIApplicationDelegate {
    
    internal func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
