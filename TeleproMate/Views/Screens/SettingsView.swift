//
//  SettingsView.swift
//  TeleproMate
//
//  Created by Janghan Park on 27/9/2025.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Settings")
            .navigationDestination(for: String.self) { value in
                CreateScriptView()
            }
        }
    }
}

#Preview {
    SettingsView()
}
