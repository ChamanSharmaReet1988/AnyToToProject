//
//  OnboardingView.swift
//  AnyToDo
//
//  Created by Chaman on 14/07/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    private let totalPages = 3

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                OnboardingPageView(
                    image: "checkmark.circle.fill",
                    title: "Organize Your Tasks",
                    description: "Keep track of your to-do items easily and efficiently."
                ).tag(0)

                OnboardingPageView(
                    image: "bolt.fill",
                    title: "Stay Productive",
                    description: "Focus on what matters most every day."
                ).tag(1)

                OnboardingPageView(
                    image: "star.fill",
                    title: "Achieve Your Goals",
                    description: "Track your progress and accomplish more."
                ).tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.top)

            HStack(spacing: 8) {
                ForEach(0..<totalPages, id: \.self) { index in
                    Circle()
                        .fill(index == currentPage ? Color(hex: "#007AFF") : Color(hex: "#E5F0FF"))
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.top, 8)

            Spacer(minLength: 150)

            if currentPage == totalPages - 1 {
                Button(action: {
                    // Handle finish onboarding action
                }) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#007AFF"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            } else {
                Button(action: {
                    withAnimation {
                        currentPage += 1
                    }
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#007AFF"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }

            Spacer(minLength: 40)
        }
        .background(Color(hex: "#FFFFFF"))
        .ignoresSafeArea()
    }
}

struct OnboardingPageView: View {
    let image: String
    let title: String
    let description: String

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            ZStack {
                Circle()
                    .fill(Color(hex: "#E5F0FF"))
                    .frame(width: 200, height: 200)
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(Color(hex: "#007AFF"))
            }

            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "#1C1C1E"))
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Text(description)
                .font(.body)
                .foregroundColor(Color(hex: "#8E8E93"))
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}

#Preview {
    OnboardingView()
}
