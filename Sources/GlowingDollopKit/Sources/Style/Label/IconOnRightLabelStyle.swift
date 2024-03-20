import SwiftUI

public struct IconOnRightLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            configuration.title; configuration.icon
        }
    }
}

extension LabelStyle where Self == IconOnRightLabelStyle {
    public static var iconRight: Self {
        get { return .init() }
    }
}

struct IconOnRightLabelStyle_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Label("Мобирикс", systemImage: "hammer").labelStyle(.iconRight)
    }
}
