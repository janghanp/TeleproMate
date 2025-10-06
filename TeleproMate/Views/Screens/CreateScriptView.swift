//
//  CreateScriptView.swift
//  TeleproMate
//
//  Created by Janghan Park on 27/9/2025.
//

import Foundation
import SwiftData
import SwiftUI

struct CreateScriptView: View {
    @Environment(\.modelContext) var context

    @State private var title: String = ""
    @State private var content: String = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TextField("Title", text: $title)
                        .fontWeight(.medium)
                        .font(.system(size: 20))
                        .disableAutocorrection(true)
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(1), lineWidth: 1)
                        )
                        .tint(.green)

                    TextEditor(text: $content)
                        .frame(height: 400)
                        .disableAutocorrection(true)
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(1), lineWidth: 1)
                        )
                        .tint(.green)

                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            }
            .navigationTitle("New script")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done", systemImage: "checkmark") {
                        print("clicked")

                        let newScript = Script(title: title, content: content)

                        context.insert(newScript)

                    }
                    .tint(.green)
                }
            }
        }
    }
}

#Preview {
    CreateScriptView()
}
