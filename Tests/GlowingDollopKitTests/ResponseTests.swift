import XCTest
import GlowingDollopKit

final class ResponseTests: XCTestCase {
	private let response: Response = try! JSONDecoder().decode(
		Response.self,
		from: try! String(
			contentsOf: Bundle.module.url(forResource: "Response", withExtension: "json")!
		).data(using: .utf8)!
	)

	func testDecodeShouldThrow() {
		guard let data = "".data(using: .utf8) else { fatalError() }

		XCTAssertThrowsError(
			JSONDecoder().decode(Response.self, from: data)
		)
	}

	func testDecodeShouldNotThrow() {
		guard let url = Bundle.module.url(forResource: "Response", withExtension: "json") else { fatalError() }
		guard let string = try? String(contentsOf: url) else { fatalError() }
		guard let data = string.data(using: .utf8) else { fatalError() }

		XCTAssertNoThrow(
		 	JSONDecoder().decode(Response.self, from: data)
		)
	}

	func testResponse() {
		XCTAssert(response.offers.count, 4)
		XCTAssert(response.vacancies.count, 6)
	}
}