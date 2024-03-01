import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ScrollContent(elementsCount: 100)
                .safeAreaInset(edge: .bottom) {
                    SafeAreaContent()
                }
                .tabItem {
                    TabItem()
                }
        }
    }
}

extension ContentView {
    @ViewBuilder
    private func ScrollContent(elementsCount: Int) -> some View {
        ScrollView {
            ForEach(0..<elementsCount, id: \.self) { index in
                Item(text: "\(index + 1)")
                    .frame(maxWidth: .infinity)
            }
        }
    }

    @ViewBuilder
    private func Item(text: String) -> some View {
        Text(text)
            .font(.title)
    }
}

extension ContentView {
    @ViewBuilder
    private func SafeAreaContent() -> some View {
        Rectangle()
            .foregroundColor(.red)
            .frame(height: 50)
            .opacity(0.8)
    }

    @ViewBuilder
    private func TabItem() -> some View {
        Label("First", systemImage: "star.fill")
    }
}

#Preview {
    ContentView()
}
