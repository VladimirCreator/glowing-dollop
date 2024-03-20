import SwiftUI
#if canImport(GlowingDollopKit)
import GlowingDollopKit
#endif

extension Response.Vacancy: Hashable, Equatable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    public static func ==(_ lhs: Self, _ rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

struct RootView: View {
    enum Enclosure {
        case second
    }
    @State private var route: [Enclosure] = []
    @State private var has: Bool = false
    @StateObject private var stViewModel = StEntryViewModel()
    @EnvironmentObject private var searchViewModel: SearchViewModel

    private var selectedVacancies: Int {
        get {
            return searchViewModel.favoritedVacancies.count
        }
    }
    
    var body: some View {
        TabView {
            search; favorite; response; message; profile
        }
        .font(.system(size: 14))
        .tint(GlowingDollopKitAsset.Assets.blueColor.swiftUIColor)
    }
    
    private var root: some View {
        NavigationStack(path: $route) {
            StView(viewModel: stViewModel) {
                route.append(.second)
            }
                .padding(.horizontal, 16)
                .navigationDestination(for: Enclosure.self) {
                    switch $0 {
                    case .second: NdEntryView(ndViewModel: .init(stEntryViewModel: stViewModel)) {
                        has = true
                    }
                    .padding(.horizontal, 16)
                    }
                }
        }
    }
    
    private var search: some View {
        AnyView(
            has ? AnyView(
                NavigationStack {
                    SearchView()
                }
            ) : AnyView(root)
        )
        .tabItem {
            Label {
                Text("Поиск")
            } icon: {
                AsyncImage(url: .init(string: "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/b9287da9-92dd-4ba2-94d8-1ef27542f2d")) { image in
                    image
                } placeholder: {
                    Label("GlowingDollopKitAsset.Assets.magnifyingGlass.", systemImage: "magnifyingglass")
                }
            }
        }
    }
    private var favorite: some View {
        AnyView(
            has ? AnyView(
                NavigationStack {
                    FavoriteView()
                }
            ) : AnyView(root)
        )
        .badge(selectedVacancies)
        .tabItem {
            Label {
                Text("Избранное")
            } icon: {
                AsyncImage(url: .init(string: "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/1a734758-174a-4574-97c5-07ad7a6fd9b9")) { image in
                    image
                } placeholder: {
                    Label("GlowingDollopKitAsset.Assets.heart.", systemImage: "heart")
                }
            }
        }
    }
    private var response: some View {
        AnyView(
            has ? AnyView(
                ResponseView()
            ) : AnyView(root)
        )
        .tabItem {
            Label {
                Text("Отклики")
            } icon: {
                AsyncImage(url: .init(string: "e6781c0f-1838-4e7d-92eb-f71394031f59")) { image in
                    image
                } placeholder: {
                    Label("GlowingDollopKitAsset.Assets.envelope.", systemImage: "envelope")
                }
            }
        }
    }
    private var message: some View {
        AnyView(
            has ? AnyView(
                MessageView()
            ) : AnyView (root)
        )
        .tabItem {
            Label {
                Text("Сообщения")
            } icon: {
                AsyncImage(url: .init(string: "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/da29d178-337e-4efd-b9fa-27a2cd46755b")) { image in
                    image
                } placeholder: {
                    Label("GlowingDollopKitAsset.Assets.bubbleRight.", systemImage: "bubble.right")
                }
            }
        }
    }
    private var profile: some View {
        AnyView(
            has ? AnyView(
                ProfileView()
            ) : AnyView(root)
        )
        .tabItem {
            Label {
                Text("Профиль")
            } icon: {
                AsyncImage(url: .init(string: "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/e9dcafed-a5d2-4ed5-a14b-4359b5e906fe")) { image in
                    image
                } placeholder: {
                    Label("GlowingDollopKitAsset.Assets.person.", systemImage: "person")
                }
            }
        }
    }
}
