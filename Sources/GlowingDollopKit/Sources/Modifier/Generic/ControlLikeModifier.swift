import SwiftUI

public struct ControlLikeModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.padding(8)
            .background(GlowingDollopKitAsset.Assets.grayTwoColor.swiftUIColor)
            .clipShape(.rect(cornerRadius: 8))
    }
}

extension View {
    public func controlLike() -> some View { modifier(ControlLikeModifier()) }
}

struct ControlLikeModifier_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Text("Title").controlLike()
    }
}
