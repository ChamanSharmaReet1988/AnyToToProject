//
//  PhoneSignInSheet.swift
//  AnyToDo
//
//  Created by Sourabh Jain on 13/07/25.
//

import SwiftUI

struct PhoneSignInSheet: View {
    @ObservedObject var viewModel: AuthViewModel
    @State private var phone     = ""
    @State private var otp       = ""
    @State private var otpSent   = false
    @State private var errorMsg  = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 20) {
                    
                    if otpSent {
                        Text("OTP sent to \(phone)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        SecureField("Enter OTP", text: $otp)
                            .keyboardType(.numberPad)
                            .modifier(OutlinedField())

                        Button(action: {
                            viewModel.verifyOTP(code: otp) { success in
                                if success {
                                    errorMsg = ""
                                    viewModel.showPhoneSheet = false
                                } else {
                                    errorMsg = "Incorrect OTP. Try again."
                                }
                            }
                        }) {
                            Text("Verify OTP")
//                                .frame(maxWidth: .infinity)
                                .padding(.all)
                        }
                        .buttonStyle(FilledButtonStyle())
                    } else {
                        TextField("Mobile number (+91…)", text: $phone)
                            .keyboardType(.phonePad)
                            .modifier(OutlinedField())

                        Button(action: {
                            viewModel.sendOTP(to: phone) { sent in
                                otpSent = sent
                                errorMsg = sent ? "" : "Failed to send OTP"
                            }
                        }) {
                            Text("Send OTP")
//                                .frame(maxWidth: .infinity)
                                .padding(.all)
                        }
                        .buttonStyle(FilledButtonStyle())
                    }

                    if !errorMsg.isEmpty {
                        Text(errorMsg)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Mobile Login")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        viewModel.showPhoneSheet = false
                    }
                }
            }
        }
    }
}
