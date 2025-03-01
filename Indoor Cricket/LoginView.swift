import SwiftUI

struct LoginView: View {
    @State private var username: String = "Deepesh"
    @State private var password: String = "Jun@1989"
    @State private var isAuthenticated: Bool = false
    @StateObject private var matchSettings = MatchSettings() // Initialize MatchSettings

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Indoor Cricket Live Scoring")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 40)

                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5)

                Button(action: authenticateUser) {
                    Text("Login")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                .padding(.top, 20)
            }
            .padding()
            .navigationDestination(isPresented: $isAuthenticated) {
                SelectionView(matchSettings: matchSettings) // Pass matchSettings to SelectionView
            }
        }
    }

    private func authenticateUser() {
        if username == "Deepesh" && password == "Jun@1989" {
            isAuthenticated = true
        } else {
            // Handle authentication failure
        }
    }
}
