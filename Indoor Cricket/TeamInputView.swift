import SwiftUI

struct TeamInputView: View {
    @State private var teamOneName: String = ""
    @State private var teamTwoName: String = ""
    @State private var navigateToMatchView: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Enter Team Names")
                .font(.title)
                .padding(.bottom, 20)

            TextField("Team One Name", text: $teamOneName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5)

            TextField("Team Two Name", text: $teamTwoName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5)

            Button(action: submitTeams) {
                Text("Start Match")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            .padding(.top, 20)

//            NavigationLink(destination: MatchView(), isActive: $navigateToMatchView) {
//                EmptyView()
//            }
            
            .navigationDestination(isPresented: $navigateToMatchView) {
                MatchView()
            }
        }
        .padding()
    }

    private func submitTeams() {
        // Validate team names
        guard !teamOneName.isEmpty, !teamTwoName.isEmpty else {
            // Handle empty fields, e.g., show an alert
            return
        }
        navigateToMatchView = true
    }
}
