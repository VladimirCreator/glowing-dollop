import SwiftUI

public struct NoLabelButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label // REJECT
    }
}

extension ButtonStyle where Self == NoLabelButtonStyle {
    public static var noLabel: Self {
        get {
            return .init()
        }
    }
}

struct NoLabelButtonStyle_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Button("SwiftUI") {}.buttonStyle(.noLabel)
    }
}
