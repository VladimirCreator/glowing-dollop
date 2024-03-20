import SwiftUI
#if canImport(GlowingDollopKit)
import GlowingDollopKit
#endif

struct OTPTextField: View {
    enum Focus {
        case one, two, three, four
    }

    @FocusState private var focus: Focus?

    @Binding fileprivate var one: String
    @Binding fileprivate var two: String
    @Binding fileprivate var three: String
    @Binding fileprivate var four: String

    var body: some View {
        HStack(spacing: 8) {
            TextField("d", text: $one, prompt: Text("*"))
                .modifier(OTPModifier(pin: $one))
                .onChange(of: one) {
                    _ in focus = .two
                }
                .focused($focus, equals: .one)
            TextField("d", text: $two, prompt: Text("*"))
                .modifier(OTPModifier(pin: $two))
                .onChange(of: two) {
                    _ in focus = .three
                }
                .focused($focus, equals: .two)
            TextField("d", text: $three, prompt: Text("*"))
                .modifier(OTPModifier(pin: $three))
                .onChange(of: three) { _ in
                    focus = .four
                }
                .focused($focus, equals: .three)
            TextField("d", text: $four, prompt: Text("*"))
                .modifier(OTPModifier(pin: $four))
                .focused($focus, equals: .four)
        }
        .font(.system(size: 24, weight: .medium))
    }
}

struct NdEntryView: View {
    @ObservedObject internal var ndViewModel: NdEntryViewModel
    
    @State private var one: String = ""
    @State private var two: String = ""
    @State private var three: String = ""
    @State private var four: String = ""

    let onConfirm: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Отправили код на \(ndViewModel.stEntryViewModel.mail)")
                .subtitle()
            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
            OTPTextField(one: $one, two: $two, three: $three, four: $four)
            Button("Подтвердить", action: onConfirm)
                .buttonStyle(.hh(.bold))
                .disabled(one.isEmpty || two.isEmpty || three.isEmpty || four.isEmpty)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}
