//
//  WelcomeView.swift
//  TeleproMate
//
//  Created by Janghan Park on 27/9/2025.
//

import SwiftUI

struct WelcomeView: View {
    @AppStorage("isWelcomed") private var isWelcomed = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                Text("Welcome to TeleproMate")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(
                    "Your ultimate tool for easy, beautiful script creation and teleprompting."
                )
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.gray)

                Button(action: {
                    isWelcomed = true
                }) {
                    Label("Get Started", systemImage: "arrow.right")
                        .labelStyle(.titleAndIcon)
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 36)
                        .padding(.vertical, 16)
                }
                .glassEffect(.regular.tint(.green).interactive())
                .padding(.top, 18)
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
