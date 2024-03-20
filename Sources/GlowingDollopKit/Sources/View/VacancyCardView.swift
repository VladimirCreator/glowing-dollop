import SwiftUI

public struct VacancyCardView: View {
    @Binding public var vacancy: Response.Vacancy

    public init(_ binding: Binding<Response.Vacancy>) {
        self._vacancy = binding
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 21) {
            VacancyPreviewView(vacancy: vacancy)
            Button("Откликнуться") {
                // does nothing according to technical specification.
            }
            .buttonStyle(.thin)
        }
        .card(.md)
        .overlay(alignment: .topTrailing) {
            Button {
                vacancy.isFavorite.toggle()
            } label: {
                Label("Favorite", systemImage: vacancy.isFavorite ? "heart.fill" : "heart")
                    .labelStyle(.iconOnly)
                    .imageScale(.large)
            }
            .padding(.top, 16).padding(.trailing, 16)
        }
    }
}
