import SwiftUI

public struct OfferLabelStyle: LabelStyle {
    public let foregroundColor: Color
    public let backgroundColor: Color

    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            ZStack {
                Circle().fill(backgroundColor).frame(width: 32, height: 32)
                configuration.icon.foregroundStyle(foregroundColor)
            }
            configuration.title.font(.system(size: 14, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

extension LabelStyle where Self == OfferLabelStyle {
    public static func offer(foregroundColor: Color, backgroundColor: Color) -> Self {
        return .init(foregroundColor: foregroundColor, backgroundColor: backgroundColor)
    }
}

struct OfferLabelStyle_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Label("Вакансии рядом с вами", systemImage: "hammer").labelStyle(.offer(foregroundColor: .red, backgroundColor: .yellow))
            .background(.green)
    }
}
