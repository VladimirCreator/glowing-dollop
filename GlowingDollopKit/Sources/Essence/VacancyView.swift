import SwiftUI

public struct VacancyView: View {
    @Binding public var vacancy: Response.Vacancy

    private var schedules: String {
        get {
            guard let firstWord = vacancy.schedules.first else { return "Contact @VladimirCreator." }
            guard let firstLetter = firstWord.first?.uppercased() else { return "Contact @VladimirCreator." }
            return vacancy.schedules.joined(separator: ", ").replacing(/^./, with: firstLetter, maxReplacements: 1)
        }
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                header
                HStack(spacing: 8) {
                    if let appliedNumber = vacancy.appliedNumber {
                        Label {
                            Text("\(appliedNumber) человек уже откликнулось")
                        } icon: {
                            AsyncImage(url: .init(string: "")) { image in
                                image
                            } placeholder: {
                                Image(systemName: "person")
                            }
                        }
                    }
                    if let lookingNumber = vacancy.lookingNumber {
                        Label {
                            Text("\(lookingNumber) человек сейчас смотрят")
                        } icon: {
                            AsyncImage(url: .init(string: "")) { image in
                                image
                            } placeholder: {
                                Image(systemName: "eye")
                            }
                        }
                    }
                }
                .labelStyle(.twoThirds)
                map
                description
                responsobilities
                VStack(alignment: .leading, spacing: 8) {
                    Text("Задайте вопрос работодателю")
                        .fontWeight(.medium)
                    Text("Он получит его с откликом на вакансию")
                        .foregroundStyle(GlowingDollopKitAsset.Assets.grayThreeColor.swiftUIColor)
                }
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(vacancy.questions, id: \.self) { question in
                        Label(question, image: "")
                    }
                    .labelStyle(.pill)
                }
                Button("Откликнуться") {
                    // does nothing according to technical specification
                }
                .buttonStyle(.hh(.bold))
            }
            .padding(.horizontal, 16)
        }
        .font(.system(size: 14))
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                AsyncImage(url: .init(string: "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/65be1e4c-7375-49dc-9779-7c5b0bea59bc")) { image in
                    image
                } placeholder: {
                    Image(systemName: "eye")
                }
                AsyncImage(url: .init(string: "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/4b386de8-d3cd-4981-b0d6-cf3ded180c03")) { image in
                    image
                } placeholder: {
                    Image(systemName: "square.and.arrow.up")
                }
                Button {
                    vacancy.isFavorite.toggle()
                } label: {
                    Image(systemName: vacancy.isFavorite ? "heart.fill" : "heart").imageScale(.large)
                }
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(vacancy.title)
                .title()
            Text(vacancy.salary.full)
            VStack(alignment: .leading, spacing: 6) {
                Text("Требуемый опыт: \(vacancy.experience.text)")
                Text(schedules)
            }
        }
        .padding(.bottom, 13)
    }
    private var description: some View {
        guard let description = vacancy.description else { return EmptyView() }
        return Text(description)
    }
    private var responsobilities: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Ваши задачи")
                .subtitle()
            Text(vacancy.responsibilities)
        }
        .padding(.bottom, 16)
    }

    private var map: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(vacancy.company, systemImage: "hammer")
                .font(.system(size: 16, weight: .medium))
            AsyncImage(url: .init(string: "https://raw.githubusercontent.com/apple/swift-org-website/main/assets/images/getting-started/article-thumbnail.jpg")) { image in
                image.resizable()
                .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
                Text("Map")
            }
            Text([vacancy.address.town, vacancy.address.street, vacancy.address.house].joined(separator: ", "))
        }
        .padding(.vertical, 12).padding(.horizontal, 16)
        .background(GlowingDollopKitAsset.Assets.grayOneColor.swiftUIColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

/*
struct VacancyView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VacancyView(vacancy: .constant(.init(id: "", lookingNumber: nil, appliedNumber: nil, title: "", description: nil, responsibilities: "", questions: [], company: "", address: .init(town: "", street: "", house: ""), experience: .init(text: "", previewText: ""), publishedDate: "", salary: .init(full: ""), schedules: [], isFavorite: false)))
    }
}
*/
