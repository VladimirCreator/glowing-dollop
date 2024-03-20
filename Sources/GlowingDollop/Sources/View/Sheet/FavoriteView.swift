import SwiftUI
#if canImport(GlowingDollopKit)
import GlowingDollopKit
#endif

struct FavoriteView: View {
    @EnvironmentObject private var searchViewModel: SearchViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                vacanciesCount
                VStack(spacing: 16) {
                    ForEach($searchViewModel.response.vacancies, id: \.id) { $vacancy in
                        if vacancy.isFavorite {
                            VacancyCardView(vacancy: $vacancy)
                        }
                        else {
                            EmptyView()
                        }
                    }
                }
            }
            .padding(.horizontal, 16).padding(.top, 12)
        }
        .navigationTitle(Text("Избранное"))
        .onAppear {
            UINavigationBar.appearance().largeTitleTextAttributes = [
                .font: UIFont.systemFont(ofSize: 20, weight: .semibold)
            ]
        }
    }

    private var vacanciesCount: some View {
        Text("\(searchViewModel.favoritedVacancies.count) вакансий")
            .foregroundStyle(GlowingDollopKitAsset.Assets.grayThreeColor.swiftUIColor)
    }
}
