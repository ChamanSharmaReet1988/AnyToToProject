//
//  OutlinedField.swift
//  AnyToDo
//
//  Created by Sourabh Jain on 13/07/25.
//

import SwiftUI

// Field border
struct OutlinedField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
    }
}

// Filled blue button
struct FilledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.all)
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}

// Outlined button
struct OutlinedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.primary)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
            .cornerRadius(10)
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}
