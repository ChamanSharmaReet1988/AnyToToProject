//
//  AuthViewModel.swift
//  AnyToDo
//
//  Created by Sourabh Jain on 13/07/25.
//

//
//  AuthViewModel.swift
//

import SwiftUI
import AuthenticationServices

@MainActor
final class AuthViewModel: ObservableObject {
    // MARK: - Published state
    @Published var isLoggedIn      = false
    @Published var showEmailSheet  = false
    @Published var showPhoneSheet  = false
    
    // MARK: - Google
    func signInWithGoogle() {
        // TODO: Integrate GoogleSignIn SDK
        print("Google Sign-In tapped")
    }
    
    // MARK: - Apple
    func handleAppleRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
    
    func handleAppleCompletion(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let auth):
            print("Apple success: \(auth)")
            isLoggedIn = true
        case .failure(let error):
            print("Apple error: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Email
    func signInWithEmail(email: String, password: String) {
        // TODO: Replace with secure backend auth
        isLoggedIn = (email == "test@example.com" && password == "123456")
    }
    
    // MARK: - Mobile (OTP)
    func sendOTP(to phone: String, completion: @escaping (Bool) -> Void) {
        print("Send OTP to \(phone)")
        // TODO: Call SMS/OTP provider
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { completion(true) }
    }
    
    func verifyOTP(code: String, completion: @escaping (Bool) -> Void) {
        print("Verify OTP code \(code)")
        // TODO: Verify with backend
        let success = (code == "123456")
        if success { isLoggedIn = true }
        completion(success)
    }
}
