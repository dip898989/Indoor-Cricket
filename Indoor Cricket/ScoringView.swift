import SwiftUI

struct ScoringView: View {
    var teamName: String
    @ObservedObject var matchSettings: MatchSettings

    var body: some View {
        VStack {
            Text("\(teamName) is batting")
                .font(.largeTitle)
                .padding()

            // Scoring interface goes here

            Spacer()
        }
        .navigationBarTitle("\(teamName) Scoring", displayMode: .inline)
    }
}
