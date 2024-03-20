import SwiftUI

public struct VacancyPreviewView: View {
    public let vacancy: Response.Vacancy

    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let lookingNumber = vacancy.lookingNumber {
                Text("Сейчас просматривает \(lookingNumber) человек")
                    .foregroundStyle(GlowingDollopKitAsset.Assets.greenColor.swiftUIColor)
            }
            Text(vacancy.title)
                .font(.system(size: 16, weight: .medium))
            VStack(alignment: .leading, spacing: 4) {
                Text(vacancy.address.town)
                Label {
                    Text(vacancy.company)
                } icon: {
                    AsyncImage(url: .init(string: "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/e1825e7a-73cd-46a8-82fb-4359ea7ce361")) { image in
                        image
                    } placeholder: {
                        Image(systemName: "checkmark.circle")
                    }
                }
                .labelStyle(.iconRight)
            }
            Label {
                Text(vacancy.experience.previewText)
            } icon: {
                AsyncImage(url: .init(string: "")) { image in
                    image
                } placeholder: {
                    Image(systemName: "suitcase")
                }
            }
            Text("Опубликовано \(vacancy.publishedDate)")
                .foregroundStyle(GlowingDollopKitAsset.Assets.grayThreeColor.swiftUIColor)
        }
        .font(.system(size: 14))
        .foregroundStyle(GlowingDollopKitAsset.Assets.whiteColor.swiftUIColor)
        .imageScale(.small)
    }
}
/*
struct VacancyPreviewView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VacancyPreviewView(vacancy: deserializedResponse.vacancies.first!)
            .card()
    }
}
*/
