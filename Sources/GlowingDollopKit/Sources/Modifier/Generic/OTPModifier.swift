import Combine
import SwiftUI

public struct OTPModifier: ViewModifier {
    @Binding public var pin: String

    public func body(content: Content) -> some View {
        content.keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .onReceive(Just(pin)) { _ in
                let numbers = pin.filter { $0.isNumber }
                self.pin = String(numbers.suffix(1))
            }
            .frame(width: 48, height: 48)
            .background(GlowingDollopKitAsset.Assets.grayTwoColor.swiftUIColor)
            .clipShape(.rect(cornerRadius: 8))
    }
}
