import SwiftUI
import Combine

class CurrentMatchSettings: ObservableObject {
    @Published var numberOfPlayers: Int = 8
    @Published var runsPerWideNoBall: Int = 2
    @Published var runsPerAerialBoundary: Int = 6
    @Published var runsPerGroundedBoundary: Int = 4
    @Published var runsDeductedPerDismissal: Int = -4
    @Published var lastOverReballOnExtras: Bool = true
    @Published var bonusOver: Bool = false
    @Published var team1Name: String = "Team 1"
    @Published var team2Name: String = "Team 2"
    @Published var team1Players: [String] = []
    @Published var team2Players: [String] = []
    
}
