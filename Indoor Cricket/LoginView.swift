import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var matchSettings = MatchSettings()
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("backgroundImage_test") // Ensure this name matches the asset name exactly
                    .resizable()
                    .scaledToFill() // Fill the entire screen
                    .ignoresSafeArea() // Ignore safe area to cover everything
                
                // Centered Content
                VStack(spacing: 20) {
                    Text("Indoor Cricket Live Scoring")
                        .font(.system(size: 34, weight: .semibold, design: .monospaced))
                        .foregroundColor(Color.black)
                        .shadow(color: Color.black.opacity(0.6), radius: 3, x: 1, y: 1)
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 40)

                    TextField("Username", text: $username)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5)
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.top, 5)
                    }

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
                .frame(maxWidth: .infinity) // Ensure it takes full width
                //.frame(maxHeight: .infinity) // Ensure it centers properly
                .background(Color.white.opacity(0.7)) // Light background for readability
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding(.horizontal, 20) // Avoid edge sticking
            }
            .navigationDestination(isPresented: $authViewModel.isAuthenticated) {
                SelectionView(matchSettings: matchSettings)
                    .environmentObject(authViewModel)
            }
        }
    }

    private func authenticateUser() {
        if username == "Deepesh" && password == "Jun@1989" {
            authViewModel.isAuthenticated = true
            errorMessage = nil // Reset error message
        } else {
            errorMessage = "Invalid username or password. Try again."
            // Handle authentication failure
        }
    }
}
