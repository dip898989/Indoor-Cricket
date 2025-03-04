import SwiftUI

struct MatchView: View {
    @StateObject private var matchSettings = MatchSettings()
    @State private var navigateToSelectionView = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Match Settings")
                    .font(.largeTitle)
                    .padding(.bottom, 20)

                Group {
                    HStack {
                        Text("Number of Players:")
                        Spacer()
                        Text("\(matchSettings.numberOfPlayers)")
                    }
                    HStack {
                        Text("Runs per Wide/No Ball:")
                        Spacer()
                        Text("\(matchSettings.runsPerWideNoBall)")
                    }
                    HStack {
                        Text("Runs per Aerial Boundary:")
                        Spacer()
                        Text("\(matchSettings.runsPerAerialBoundary)")
                    }
                    HStack {
                        Text("Runs per Grounded Boundary:")
                        Spacer()
                        Text("\(matchSettings.runsPerGroundedBoundary)")
                    }
                    HStack {
                        Text("Runs Deducted per Dismissal:")
                        Spacer()
                        Text("\(matchSettings.runsDeductedPerDismissal)")
                    }
                    HStack {
                        Text("Last Over Re-ball on Extras:")
                        Spacer()
                        Text(matchSettings.lastOverReballOnExtras ? "Yes" : "No")
                    }
                    HStack {
                        Text("Bonus Over:")
                        Spacer()
                        Text(matchSettings.bonusOver ? "Yes" : "No")
                    }
                }
                .padding(.horizontal)
                .font(.headline)

                Spacer()

//                NavigationLink(destination: SelectionView(matchSettings: matchSettings), isActive: $navigateToSelectionView) {
//                    EmptyView()
//                }
                
                .navigationDestination(isPresented: $navigateToSelectionView) {
                    SelectionView(matchSettings: matchSettings)
                }

                Button(action: {
                    navigateToSelectionView = true
                }) {
                    Text("Edit Settings")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
//            .navigationBarTitle("Match Configuration", displayMode: .inline)
        }
    }
}
