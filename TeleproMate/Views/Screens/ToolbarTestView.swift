import SwiftUI

struct ToolbarTestView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(0..<50) { _ in
                        Text("test")
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            }
            .navigationTitle("Toolbar Test")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ToolbarTestView()
}
