import SwiftUI

public struct OfferView: View {
    public let offer: Response.Offer
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Label(offer.title, systemImage: "hammer")
                .labelStyle(
                    .offer(
                        foregroundColor: GlowingDollopKitAsset.Assets.greenColor.swiftUIColor,
                        backgroundColor: GlowingDollopKitAsset.Assets.darkGreenColor.swiftUIColor
                    )
                )
            button
        }
        .lineSpacing(1.2)
    }

    private var button: some View {
        guard let text = offer.button?.text else { return AnyView(EmptyView()) }
        return AnyView(
            Button(text) {
                // does nothing according to technical specification.
            }
            .font(.system(size: 14))
            .foregroundColor(GlowingDollopKitAsset.Assets.greenColor.swiftUIColor)
        )
    }
}
/*
struct OfferView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VStack {
            OfferView(offer: deserializedResponse.offers.last!)
                .card(.sm)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(deserializedResponse.offers, id: \.id) { offer in
                        OfferView(offer: offer)
                    }
                    .background(.red)
                }
            }
        }
    }
}
*/
