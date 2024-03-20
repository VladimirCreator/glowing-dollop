import Foundation

public struct Response: Codable {
    public struct Offer: Codable {
        public struct Button: Codable {
            public var text: String

            public init(text: String) {
                self.text = text
            }
        }

        public var id: String?
        public var title: String
        public var link: String
        public var button: Button?

        public init(id: String?, title: String, link: String, button: Button?) {
            self.id = id; self.title = title; self.link = link; self.button = button
        }
    }
    public struct Vacancy: Codable {
        public struct Address: Codable {
            public var town: String
            public var street: String
            public var house: String

            public init(town: String, street: String, house: String) {
                self.town = town; self.street = street; self.house = house
            }
        }
        public struct Experience: Codable {
            public var text, previewText: String
            public init(text: String, previewText: String) {
                self.text = text; self.previewText = previewText
            }
        }
        public struct Salary: Codable {
            public var full: String
            public var short: String?

            public init(full: String, short: String?) {
                self.full = full; self.short = short
            }
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

        public init(id: String, lookingNumber: Int?, appliedNumber: Int?, title: String, description: String?, responsibilities: String, questions: [String], company: String, address: Address, experience: Experience, publishedDate: String, salary: Salary, schedules: [String], isFavorite: Bool) {
            self.id = id
            self.lookingNumber = lookingNumber
            self.appliedNumber = appliedNumber
            self.title = title
            self.description = description
            self.responsibilities = responsibilities
            self.questions = questions
            self.company = company
            self.address = address
            self.experience = experience
            self.publishedDate = publishedDate
            self.salary = salary
            self.schedules = schedules
            self.isFavorite = isFavorite
        }
    }

    public var offers: [Offer]
    public var vacancies: [Vacancy]

    public init(offers: [Offer], vacancies: [Vacancy]) {
        self.offers = offers; self.vacancies = vacancies
    }
}
