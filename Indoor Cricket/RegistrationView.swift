//
//  RegistrationView.swift
//  Indoor Cricket
//
//  Created by Deepesh Viswanathan on 28/02/2025.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var newUsername: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var registrationError: String?

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Register")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 40)

                TextField("Username", text: $newUsername)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5)

                SecureField("Password", text: $newPassword)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5)

                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5)

                if let error = registrationError {
                    Text(error)
                        .foregroundColor(.red)
                }

                Button(action: {
                    registerUser()
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(5)
                }
                .padding(.top, 20)
            }
            .padding()
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }

    private func registerUser() {
        // Implement your registration logic here
        // Validate passwords match and handle errors appropriately
        // Dismiss the view upon successful registration
    }
}
