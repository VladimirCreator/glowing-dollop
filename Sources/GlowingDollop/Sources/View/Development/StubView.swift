import SwiftUI

struct StubView: View {
    var body: some View {
        Label("I am under development.", systemImage: "hammer")
            .labelStyle(.iconOnly)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.green.gradient)
    }
}
