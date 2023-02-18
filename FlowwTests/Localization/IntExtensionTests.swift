import XCTest
@testable import Floww

final class IntExtensionTests: XCTestCase {

    func test_numberOfBillions() {
        XCTAssertEqual(100000000.numberOfBillions, 0.1)
        XCTAssertEqual(1000000000.numberOfBillions, 1)
        XCTAssertEqual(10000000000.numberOfBillions, 10)
        XCTAssertEqual(100000000000.numberOfBillions, 100)
    }

}
