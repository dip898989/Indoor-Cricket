import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var matchSettings = MatchSettings()

    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    // Background Image
                    Spacer()
                    Image("backgroundImage_test") // Replace with your actual image name
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped() // Ensure the image is clipped to its bounds
                        .ignoresSafeArea() // Ensure it ignores the safe areas
                    
                    // Centered Content
                        VStack {
                            Spacer() // Top Spacer to push content down
                            Text("Indoor Cricket Live Scoring")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
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
                            
                            Button(action: authenticateUser) {
                                Text("Login")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(5)
                            }
                            .padding(.top, 20)
                            
                            Spacer() // Bottom Spacer to push content up
                        }
                        .padding()
                        .background(Color.white.opacity(0.7)) // Light background for readability
                        .cornerRadius(10) // Rounded corners for the container
                        .shadow(radius: 10) // Optional shadow to make the container stand out
                        .padding(.horizontal, 20) // Avoid edge sticking
                        .padding(.vertical, 20)
                    }
                    Spacer()
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
        } else {
            // Handle authentication failure
        }
    }
}
