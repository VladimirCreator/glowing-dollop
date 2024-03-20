import SwiftUI

public struct HHButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    public enum Style {
        case regular, bold
    }
    public let style: Style

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .regular:
            configuration.label.font(.system(size: 14))
                .padding(.vertical, 11)
                .background(isEnabled ? GlowingDollopKitAsset.Assets.blueColor.swiftUIColor : GlowingDollopKitAsset.Assets.darkBlueColor.swiftUIColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        case .bold:
            configuration.label.font(.system(size: 16, weight: .semibold))
                .padding(.top, 14).padding(.bottom, 13)
                .frame(maxWidth: .infinity)
                .background(isEnabled ? GlowingDollopKitAsset.Assets.blueColor.swiftUIColor : GlowingDollopKitAsset.Assets.darkBlueColor.swiftUIColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

extension ButtonStyle where Self == HHButtonStyle {
    public static func hh(_ style: HHButtonStyle.Style) -> Self {
        return .init(style: style)
    }
}

struct HHButtonStyle_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("Продолжить") {}.buttonStyle(.hh(.regular))
            Button("Продолжить") {}.buttonStyle(.hh(.bold))
        }
    }
}
