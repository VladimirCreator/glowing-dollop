import SwiftUI
#if canImport(GlowingDollopKit)
import GlowingDollopKit
#endif

final class SearchViewModel: ObservableObject {
    private let responseService: () async -> Response

    @Published
    public var response: Response = Response(
        offers: [
            .init(id: "0", title: "Welcome", link: "undefined", button: nil)
        ],
        vacancies: [
            .init(id: "0", lookingNumber: nil, appliedNumber: nil, title: "Welcome", description: nil, responsibilities: "", questions: [], company: "", address: .init(town: "", street: "", house: ""), experience: .init(text: "", previewText: ""), publishedDate: "", salary: .init(full: ""), schedules: [], isFavorite: false)
        ]
    ) 
    public var favoritedVacancies: [Response.Vacancy] {
        return response.vacancies.filter { $0.isFavorite }
    }

    public init(_ service: @escaping () async -> Response) {
        self.responseService = service
        Task {
            response = await responseService()
        }
    }
}
