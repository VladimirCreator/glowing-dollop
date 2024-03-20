import SwiftUI
#if canImport(GlowingDollopKit)
import GlowingDollopKit
#endif

@main
fileprivate struct GlowingDollop: App {
    @StateObject private var searchViewModel: SearchViewModel = .init() async {
        guard let url: URL = .init(string: "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14") else { fatalError() }
        async let (data, _) = URLSession.shared.data(from: url)
        
        return try! await JSONDecoder().decode(Response.self, from: data)
    }

    fileprivate var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(searchViewModel)
        }
    }
}
