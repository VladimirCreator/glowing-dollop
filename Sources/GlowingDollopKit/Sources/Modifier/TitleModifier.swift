import SwiftUI

public struct TitleModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.font(.system(size: 22, weight: .semibold))
    }
}

extension View {
    public func title() -> some View { modifier(TitleModifier()) }
}

struct TitleModifier_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Text("Title").title()
    }
}
