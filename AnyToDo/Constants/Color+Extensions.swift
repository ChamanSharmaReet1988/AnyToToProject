//
//  Color+Extensions.swift
//  AnyToDo
//
//  Created by Sourabh Jain on 13/07/25.
//

import SwiftUI

extension Color {
    static let primaryBlue = Color(hex: "#007AFF")
    static let lightBlue = Color(hex: "#E5F0FF")
    static let darkBlue = Color(hex: "#003C8F")
    static let offWhite = Color(hex: "#F2F2F7")
    static let blackText = Color(hex: "#1C1C1E")
    static let midGray = Color(hex: "#8E8E93")
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255, (int >> 16) & 0xff, (int >> 8) & 0xff, int & 0xff)
        case 8:
            (a, r, g, b) = ((int >> 24) & 0xff, (int >> 16) & 0xff, (int >> 8) & 0xff, int & 0xff)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue:  Double(b) / 255,
                  opacity: Double(a) / 255)
    }
}
