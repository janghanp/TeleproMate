import Foundation
import SwiftData
import SwiftUI

private var testScripts = [
    Script(title: "title 1", content: "This is a test content for script 1"),
    Script(title: "title 2", content: "This is a test content for script 2"),
    Script(title: "title 3", content: "This is a test content for script 3"),
    Script(title: "title 4", content: "This is a test content for script 4"),
]

struct HomeView: View {
    //    @Query private var scripts: [Script]

    var body: some View {
        NavigationStack {
            List(testScripts) { script in
                NavigationLink(destination: ScriptDetailsView(script: script)) {
                    VStack(alignment: .leading) {
                        Text(script.title)
                            .font(.title3)
                        Text(Date().formatted())
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }

            }
            .listStyle(.plain)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    NavigationLink(destination: CreateScriptView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
