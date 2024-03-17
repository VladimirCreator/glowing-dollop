import SwiftUI

public struct CardModifier: ViewModifier {
	public enum Size {
		case sm, md, lg
	}

	public let size: Size

	public func body(content: Content) -> some View {
		switch size {
		case .sm:
			return content
				.padding(.horizontal, 8)
				.padding(.top, 10).padding(.bottom, 11)
				.background(GlowingDollopKitAsset.Assets.grayOneColor.swiftUIColor)
				.clipShape(.rect(cornerRadius: 8))
		case .md:
			return content
				.padding(16)
				.background(GlowingDollopKitAsset.Assets.grayOneColor.swiftUIColor)
				.clipShape(.rect(cornerRadius: 8))
		case .lg:
			return content
				.padding(.horizontal, 16).padding(.vertical, 24)
				.background(GlowingDollopKitAsset.Assets.grayOneColor.swiftUIColor)
				.clipShape(.rect(cornerRadius: 8))
		}
	}
}

extension View {
	public func card(_ size: CardModifier.Size = .md) -> some View {
		modifier(CardModifier(size: size))
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
