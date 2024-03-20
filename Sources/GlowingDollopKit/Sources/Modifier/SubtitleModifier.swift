import SwiftUI

public struct SubtitleModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.font(.system(size: 20, weight: .semibold))
    }
}

extension View {
    public func subtitle() -> some View { modifier(SubtitleModifier()) }
}

struct SubtitleModifier_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Text("Title").subtitle()
    }
}
