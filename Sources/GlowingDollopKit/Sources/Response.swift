import Foundation

public struct Response: Codable {
    public struct Offer: Codable {
        public struct Button: Codable {
            public var text: String
        }

        public var id: String?
        public var title: String
        public var link: String
        public var button: Button?
    }
    public struct Vacancy: Codable {
        public struct Address: Codable {
            public var town: String
            public var street: String
            public var house: String
        }
        public struct Experience: Codable {
            public var text, previewText: String
        }
        public struct Salary: Codable {
            public var full: String
            public var short: String?
        }
        public var id: String
        public var lookingNumber: Int?
        public var appliedNumber: Int?
        public var title: String
        public var description: String?
        public var responsibilities: String
        public var questions: [String]
        public var company: String
        public var address: Address
        public var experience: Experience
        public var publishedDate: String
        public var salary: Salary
        public var schedules: [String]
        public var isFavorite: Bool
    }

    public var offers: [Offer]
    public var vacancies: [Vacancy]
}
