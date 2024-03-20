import SwiftUI

public struct Title3Modifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.font(.system(size: 16, weight: .medium))
    }
}

extension View {
    public func title3() -> some View { modifier(Title3Modifier()) }
}

struct Title3Modifier_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Text("Title").title3()
    }
}
