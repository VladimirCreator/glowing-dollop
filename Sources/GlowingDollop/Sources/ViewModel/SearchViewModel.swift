import SwiftUI
#if canImport(GlowingDollopKit)
import GlowingDollopKit
#endif

final class SearchViewModel: ObservableObject {
    private let responseService: () async -> Response

    @Published
    public var response: Response = Response(
        offers: [
            Response.Offer(
                id: "0",
                title: "Welcome",
                link: "undefined",
                button: Response.Offer.Button(text: "undefined")
            )
        ],
        vacancies: [
            Response.Vacancy(
                id: "0",
                lookingNumber: 0,
                appliedNumber: 0,
                title: "Welcome",
                description: "",
                responsibilities: "",
                questions: [],
                company: "",
                address: Response.Vacancy.Address(town: "", street: "", house: ""),
                experience: Response.Vacancy.Experience(text: "", previewText: ""),
                publishedDate: "",
                salary: Response.Vacancy.Salary(full: "", short: ""),
                schedules: [],
                isFavorite: false
            )
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
