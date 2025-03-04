import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var matchSettings = MatchSettings()

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
            .navigationDestination(isPresented: $authViewModel.isAuthenticated) {
                SelectionView(matchSettings: matchSettings)
                    .environmentObject(authViewModel)
            }
        }
    }

    private func authenticateUser() {
        if username == "Deepesh" && password == "Jun@1989" {
            authViewModel.isAuthenticated = true
        } else {
            // Handle authentication failure
        }
    }
}

