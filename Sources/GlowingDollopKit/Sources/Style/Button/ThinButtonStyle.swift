import SwiftUI

public struct ThinButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label.font(.system(size: 14))
            .foregroundStyle(GlowingDollopKitAsset.Assets.whiteColor.swiftUIColor)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 7)
            .background(
                RoundedRectangle(cornerRadius: 50)
                    .fill(
                        GlowingDollopKitAsset.Assets.greenColor.swiftUIColor
                            .shadow(
                                .drop(
                                    color: .init(
                                        .sRGB, red: .zero, green: .zero, blue: .zero,
                                        opacity: configuration.isPressed ? 0.25 : .zero
                                    ),
                                    radius: 4, x: .zero, y: 4
                                )
                            )
                    )
            )
    }
}

extension ButtonStyle where Self == ThinButtonStyle {
    public static var thin: ThinButtonStyle {
        get {
            return .init()
        }
    }
}

struct ThinButtonStyle_PreviewProvider: PreviewProvider {
    static var previews: some View {
        if false {
            VStack {
                Button("Откликнуться") {}.buttonStyle(.thin)
                Button("Откликнуться") {}.buttonStyle(.thin)
            }
        }
        else {
            Button("Откликнуться") {}.buttonStyle(.thin)
        }
    }
}
