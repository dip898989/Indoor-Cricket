import SwiftUI

struct Team2DetailsView: View {
    @ObservedObject var matchSettings: MatchSettings
    @State private var playerNames: [String]

    init(matchSettings: MatchSettings) {
        self.matchSettings = matchSettings
        // Initialize playerNames with empty strings based on the number of players in Team 1
        _playerNames = State(initialValue: Array(repeating: "", count: matchSettings.team1Players.count))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Enter Team 2 Player Names")
                .font(.largeTitle)
                .padding(.bottom, 20)

            Form {
                ForEach(0..<playerNames.count, id: \.self) { index in
                    TextField("Player \(index + 1)", text: $playerNames[index])
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }

            Spacer()

            NavigationLink(destination: SelectBattingTeamView(matchSettings: matchSettings)) {
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
                matchSettings.team2Players = playerNames
            })
        }
        .padding()
        .navigationBarTitle("Team 2 Details", displayMode: .inline)
    }
}
