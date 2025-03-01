//
//  CricketScoringApp.swift
//  Indoor Cricket
//
//  Created by Deepesh Viswanathan on 28/02/2025.
//

import SwiftUI

@main
struct CricketScoringApp: App {
    @State private var isAuthenticated: Bool = false

    var body: some Scene {
        WindowGroup {
            if isAuthenticated {
                // Replace with your main app view
                Text("Welcome to the Indoor Cricket Live Scoring App!")
            } else {
                LoginView()
            }
        }
    }
}
