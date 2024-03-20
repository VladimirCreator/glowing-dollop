import SwiftUI

public struct TwoThirdsLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top, spacing: 21) {
            configuration.title.font(.system(size: 14))
                .lineLimit(2)
                .lineSpacing(1.2)
            configuration.icon.imageScale(.small)
                .frame(width: 16, height: 16)
                .background(Circle().fill(GlowingDollopKitAsset.Assets.greenColor.swiftUIColor))
        }
        .padding(8)
        .frame(maxWidth: 160)
        .foregroundStyle(GlowingDollopKitAsset.Assets.whiteColor.swiftUIColor)
        .background(GlowingDollopKitAsset.Assets.darkGreenColor.swiftUIColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension LabelStyle where Self == TwoThirdsLabelStyle {
    public static var twoThirds: Self {
        get { return .init() }
    }
}

struct TwoThirdsLabelStyle_PreviewProvider: PreviewProvider {
    static var previews: some View {
        HStack {
            Label("147 человек уже откликнулось", systemImage: "person")
            Label("147 человек уже откликнулось", systemImage: "person")
        }
        .labelStyle(.twoThirds)
        .frame(width: 328)
    }
}
