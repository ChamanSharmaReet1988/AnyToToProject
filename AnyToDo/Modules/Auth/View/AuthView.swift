//
//  AuthView.swift
//  AnyToDo
//
//  Created by Sourabh Jain on 13/07/25.
//

//
//  AuthView.swift
//

import SwiftUI
import AuthenticationServices

struct AuthView: View {
    @StateObject private var viewModel = AuthViewModel()
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            // MARK: - Logo & Welcome
            VStack(spacing: 8) {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
                
                Text("Welcome to ToDo")
                    .font(.title).bold()
                    .foregroundColor(.primary)
            }
            
            // MARK: - Auth Buttons
            VStack(spacing: 16) {
                
                // Google
                Button {
                    viewModel.signInWithGoogle()
                } label: {
                    HStack {
                        Image(systemName: "globe")
                        Text("Continue with Google")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                .buttonStyle(OutlinedButtonStyle())
                
                // Apple
                SignInWithAppleButton(
                    .signIn,
                    onRequest:  viewModel.handleAppleRequest(_:),
                    onCompletion: viewModel.handleAppleCompletion(_:))
                    .signInWithAppleButtonStyle(.black)
                    .frame(height: 45)
                    .cornerRadius(10)
                
                // Email
                Button {
                    viewModel.showEmailSheet = true
                } label: {
                    HStack {
                        Image(systemName: "envelope.fill")
                        Text("Continue with Email")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                .buttonStyle(FilledButtonStyle())
                
                // Mobile
                Button {
                    viewModel.showPhoneSheet = true
                } label: {
                    HStack {
                        Image(systemName: "phone.fill")
                        Text("Continue with Mobile")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                .buttonStyle(OutlinedButtonStyle())
            }
            .padding(.horizontal)
            .sheet(isPresented: $viewModel.showEmailSheet) {
                EmailSignInSheet(viewModel: viewModel)
            }
            .sheet(isPresented: $viewModel.showPhoneSheet) {
                PhoneSignInSheet(viewModel: viewModel)
            }
            
            Spacer()
            
            Text("By continuing, you agree to our Terms & Privacy Policy.")
                .font(.footnote)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.bottom)
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
    }
}

#Preview { AuthView() }
