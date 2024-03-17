import Foundation
import XCTest
@testable import GlowingDollopKit

final class ResponseTests: XCTestCase {
	private let response: Response = try! JSONDecoder().decode(
		Response.self,
		from: try! String(
			contentsOf: Bundle.module.url(forResource: "Response", withExtension: "json")!
		).filter { !$0.isNewline }.data(using: .utf8)!
	)

	func testDecodeShouldThrow() {
		guard let data = "".data(using: .utf8) else { fatalError() }

		XCTAssertThrowsError(
			try JSONDecoder().decode(Response.self, from: data)
		)
	}

	func testDecodeShouldNotThrow() {
		guard let url = Bundle.module.url(forResource: "Response", withExtension: "json") else { fatalError() }
		guard let string = try? String(contentsOf: url).filter({ !$0.isNewline }) else { fatalError() }
		guard let data = string.data(using: .utf8) else { fatalError() }

		XCTAssertNoThrow(
		 	try JSONDecoder().decode(Response.self, from: data)
		)
	}

	func testResponse() {
		XCTAssertEqual(response.offers.count, 4)
		XCTAssertEqual(response.vacancies.count, 6)
	}
}