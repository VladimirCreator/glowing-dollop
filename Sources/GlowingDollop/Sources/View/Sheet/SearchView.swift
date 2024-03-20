import SwiftUI
#if canImport(GlowingDollopKit)
import GlowingDollopKit
#endif

struct SearchView: View {
    @EnvironmentObject internal var searchViewModel: SearchViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 8) {
                    HStack(spacing: 8) {
                        AsyncImage(url: .init(string: "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/b9287da9-92dd-4ba2-94d8-1ef275c42f2d")) { image in
                            image.resizable().aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Image(systemName: "magnifyingglass")
                        }
                        TextField("", text: .constant(""), prompt: Text("Должность, ключевые слова")).foregroundStyle(GlowingDollopKitAsset.Assets.grayFourColor.swiftUIColor)
                    }
                    .font(.system(size: 14))
                    .foregroundStyle(GlowingDollopKitAsset.Assets.grayFourColor.swiftUIColor)
                    .controlLike()
                    Button {
                        
                    } label: {
                        AsyncImage(url: .init(string: "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/f70ff9b6-2122-4716-9131-d8284497d454")) { image in
                            image
                        } placeholder: {
                            Label("filter", systemImage: "slider.horizontal.2.square")
                                .labelStyle(.iconOnly)
                                .foregroundStyle(GlowingDollopKitAsset.Assets.whiteColor.swiftUIColor)
                        }
                    }
                    .controlLike()
                }
                .padding(.top, 16)
                ScrollView(.horizontal) {
                    offers
                }
                Text("Вакансии для вас")
                    .subtitle()
                vacancies
            }
            .padding(.horizontal, 16)
        }
        .background(GlowingDollopKitAsset.Assets.shadowColor.swiftUIColor)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button("Еще \($searchViewModel.response.vacancies.count) вакансии") {
                    // does nothing according to technical specification.
                }
                .buttonStyle(.hh(.bold))
            }
        }
    }

    private var offers: some View {
        HStack(spacing: 8) {
            ForEach($searchViewModel.response.offers, id: \.id) { $offer in
                OfferView(offer: offer)
            }
            .card(.sm)
            .frame(width: 132, height: 120)
        }
    }

    private var vacancies: some View {
        VStack(spacing: 16) {
            ForEach($searchViewModel.response.vacancies[0...($searchViewModel.response.vacancies.count >= 3 ? 2 : $searchViewModel.response.vacancies.count - 1)], id: \.id) { $vacancy in
                NavigationLink {
                    VacancyView(vacancy: $vacancy)
                } label: {
                    VacancyCardView(vacancy: $vacancy)
                }
            }
        }
    }
}
