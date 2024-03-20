import Combine

final class NdEntryViewModel: ObservableObject {
    public let stEntryViewModel: StEntryViewModel

    public init(stEntryViewModel: StEntryViewModel) {
        self.stEntryViewModel = stEntryViewModel
    }
}
