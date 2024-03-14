import Foundation
import XCTest

final class GlowingDollopUITests: XCTestCase {
    func testStub() {
        let instance: XCUIApplication = .init()
        instance.launch()

        XCTestAssertTrue(instance.staticTexts.element.exists)
    }
}
