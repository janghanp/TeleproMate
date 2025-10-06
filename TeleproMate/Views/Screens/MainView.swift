//
//  ContentView.swift
//  TeleproMate
//
//  Created by Janghan Park on 27/9/2025.
//

import SwiftData
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .tint(Color.green)
    }
}

#Preview {
    MainView()
}
