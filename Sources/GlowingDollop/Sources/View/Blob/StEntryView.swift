import SwiftUI
#if canImport(GlowingDollopKit)
import GlowingDollopKit
#endif

struct StView: View {
    @ObservedObject internal var viewModel: StEntryViewModel

    let onContinue: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            searchWorkCard; searchEmployeesCard
        }
        .foregroundStyle(GlowingDollopKitAsset.Assets.whiteColor.swiftUIColor)
        .navigationTitle("Вход в личный кабинет")
        .onAppear {
            UINavigationBar.appearance().largeTitleTextAttributes = [
                .font: UIFont.systemFont(ofSize: 20, weight: .semibold)
            ]
        }
    }

    private var continueButton: some View {
        Button("Продолжить") {
            viewModel.isEntering = true
            guard viewModel.containsExpectation else { return }
            onContinue()
        }
        .disabled(viewModel.mail.isEmpty)
        .buttonStyle(.hh(.bold)).fontWeight(.regular)
    }
    private var continueWithPasswordButton: some View {
        Button("Войти с паролем") {
            // does nothing according to technical specification.
        }
        .foregroundStyle(GlowingDollopKitAsset.Assets.blueColor.swiftUIColor)
        .padding(.leading, 14).padding(.trailing, 10)
    }

    private var searchWorkCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Поиск работы").title3()
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading) {
                    HStack(spacing: 8) {
                        AsyncImage(url: .init(string: "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/e6781c0f-1838-4e7d-92eb-f71394031f59")) { image in
                            image
                        } placeholder: {
                            Image(systemName: "envelope")
                        }
                        TextField("", text: $viewModel.mail, prompt: Text("Электронная почта или телефон"))
                            .onChange(of: viewModel.mail) { _ in
                                viewModel.isEntering = false
                            }
                    }
                }
                .controlLike()
                .overlay {
                    RoundedRectangle(cornerRadius: 8).stroke(viewModel.isEntering && !viewModel.containsExpectation ? .red : .clear)
                }
                if viewModel.isEntering && !viewModel.containsExpectation {
                    Text("Вы ввели неверный email")
                        .foregroundStyle(.red)
                }
            }
            HStack(spacing: 0) {
                continueButton; continueWithPasswordButton
            }
        }
        .card(.lg)
    }
    private var searchEmployeesCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Поиск сотрудников").title3()
                Text("Размещение вакансий и доступ к базе резюме")
            }
            Button("Я ищу сотрудников") {
                // does nothing according to technical specification. 
            }
            .buttonStyle(.thin)
        }
        .card(.lg)
    }
}
