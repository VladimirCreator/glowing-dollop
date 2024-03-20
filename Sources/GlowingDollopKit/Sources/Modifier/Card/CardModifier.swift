import SwiftUI

public struct CardModifier: ViewModifier {
    public enum Size {
        case sm
        case md
        case lg
    }

    public let size: Size

    public func body(content: Content) -> some View {
        switch size {
        case .sm:
            return AnyView(
                content
                .padding(.leading, 8).padding(.trailing, 12)
                .padding(.top, 10).padding(.bottom, 11)
            )
        case .md:
            return AnyView(content.padding(16))
        case .lg:
            return AnyView(content.padding(.horizontal, 16).padding(.vertical, 24))
        }
    }
}

extension View {
    public func card(_ size: CardModifier.Size = .md) -> some View {
        self.modifier(CardModifier(size: size))
            .background(GlowingDollopKitAsset.Assets.grayOneColor.swiftUIColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct CardModifier_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Text("Text").card()
    }
}

struct SmallCardModifier_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Text("Text").card(.sm)
    }
}

struct MediumCardModifier_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Text("Text").card(.md)
    }
}

struct LargeCardModifier_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Text("Text").card(.lg)
    }
}
