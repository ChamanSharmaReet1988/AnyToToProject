//
//  EmailSignInSheet.swift
//  AnyToDo
//
//  Created by Sourabh Jain on 13/07/25.
//

//
//  EmailSignInSheet.swift
//

import SwiftUI

struct EmailSignInSheet: View {
    @ObservedObject var viewModel: AuthViewModel
    @State private var email    = ""
    @State private var password = ""
    @State private var showErr  = false
    @State private var errorMsg = ""

    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 20) {
                    
                    // Email Field
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .modifier(OutlinedField())

                    // Password Field
                    SecureField("Password", text: $password)
                        .modifier(OutlinedField())

                    // Sign In Button
                    Button(action: {
                        viewModel.signInWithEmail(email: email, password: password)
                        showErr = !viewModel.isLoggedIn
                        errorMsg = viewModel.isLoggedIn ? "" : "Invalid credentials"
                        if viewModel.isLoggedIn {
                            viewModel.showEmailSheet = false
                        }
                    }) {
                        Text("Sign In")
//                            .frame(maxWidth: .infinity)
                            .padding(.all)
                    }
                    .buttonStyle(FilledButtonStyle())

                    // Error Message
                    if showErr {
                        Text(errorMsg)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding()

                Spacer()
            }
            .navigationTitle("Email Login")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        viewModel.showEmailSheet = false
                    }
                }
            }
        }
    }
}
