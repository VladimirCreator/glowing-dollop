import SwiftUI

public struct PillLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.title.font(.system(size: 14, weight: .medium))
            .padding(.horizontal, 12).padding(.vertical, 8)
            .background(GlowingDollopKitAsset.Assets.grayTwoColor.swiftUIColor)
            .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}

extension LabelStyle where Self == PillLabelStyle {
    public static var pill: PillLabelStyle {
        get { return .init() }
    }
}

struct PillLabelStyle_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Label("Где располагается место работы?", systemImage: "hammer").labelStyle(.pill)
    }
}
