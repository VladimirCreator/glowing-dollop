import Combine

final class StEntryViewModel: ObservableObject {
    @Published
    public var mail: String = ""
    @Published
    public var isEntering: Bool = false

    public var containsExpectation: Bool {
        mail.contains(/^[0-9a-zA-Z]+@[a-zA-Z]+\.[a-zA-Z]+$/)
    }

    public init() {
        
    }
}
