//
//  SplashScreenView.swift.swift
//  AnyToDo
//
//  Created by Sourabh Jain on 13/07/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var animate = false
    @State private var showAuth = false

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .scaleEffect(animate ? 1 : 0.6)
                    .opacity(animate ? 1 : 0.4)
                    .animation(.easeOut(duration: 0.8), value: animate)

                Text("ToDo")
                    .font(.largeTitle).bold()
                    .foregroundColor(.blue)
                    .opacity(animate ? 1 : 0)
                    .animation(.easeInOut.delay(0.3), value: animate)
            }
            .onAppear {
                animate = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                    showAuth = true
                }
            }

            if showAuth {
                AuthView()
                    .transition(.opacity)
            }
        }
    }
}
