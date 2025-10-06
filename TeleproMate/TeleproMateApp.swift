//
//  TeleproMateApp.swift
//  TeleproMate
//
//  Created by Janghan Park on 27/9/2025.
//

import SwiftUI
import SwiftData

@main
struct TeleproMateApp: App {
    @AppStorage("isWelcomed") private var isWelcomed: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if (isWelcomed) {
                MainView()
            } else {
                WelcomeView()
            }
        }
        .modelContainer(for: Script.self)
    }
}
