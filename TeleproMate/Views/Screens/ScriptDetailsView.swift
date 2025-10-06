//
//  ScriptDetailsView.swift
//  TeleproMate
//
//  Created by Janghan Park on 27/9/2025.
//

import SwiftUI

struct ScriptDetailsView: View {
    let script: Script

    var body: some View {
        ZStack {
            CustomScrollAreaWrapper()
                .ignoresSafeArea(.all)
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    let newScript = Script(
        title: "New Script",
        content: """
            test
            """
    )
    ScriptDetailsView(script: newScript)
}
