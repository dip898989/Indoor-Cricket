import SwiftUI

struct Team1DetailsView: View {
    @ObservedObject var matchSettings: MatchSettings
    @State private var playerNames: [String]

    init(matchSettings: MatchSettings) {
        self.matchSettings = matchSettings
        // Initialize playerNames with empty strings based on the number of players
        _playerNames = State(initialValue: Array(repeating: "", count: matchSettings.numberOfPlayers))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Enter Team 1 Player Names")
                .font(.largeTitle)
                .padding(.bottom, 20)

            Form {
                ForEach(0..<matchSettings.numberOfPlayers, id: \.self) { index in
                    TextField("Player \(index + 1)", text: $playerNames[index])
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }

            Spacer()

            NavigationLink(destination: Team2DetailsView(matchSettings: matchSettings)) {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
            .simultaneousGesture(TapGesture().onEnded {
                // Update the matchSettings with the entered player names
                matchSettings.team1Players = playerNames
            })
        }
        .padding()
        .navigationBarTitle("Team 1 Details", displayMode: .inline)
    }
}
