import SwiftUI

@main
fileprivate struct GlowingDollop: App {
    @StateObject private var searchViewModel: SearchViewModel = .init() {
        return deserializedResponse
    }

    fileprivate var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(searchViewModel)
        }
    }
}
