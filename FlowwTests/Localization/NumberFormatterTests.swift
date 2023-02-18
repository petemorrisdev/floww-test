import XCTest
@testable import Floww

final class NumberFormatterTests: XCTestCase {

    func test_marketRankFormatter() {
        let marketRankString = NumberFormatter.marketRankFormatter.string(for: 123)
        XCTAssertEqual(marketRankString, "#123")
    }
    
    func test_marketCapFormatter() {
        let marketCapString = NumberFormatter.marketCapFormatter().string(for: 450.5122)
        XCTAssertEqual(marketCapString, "$450.5B")
    }
    
    func test_percentageFormatter() {
        let positivePercentageString = NumberFormatter.percentageFormatter.string(for: 2.3452)
        XCTAssertEqual(positivePercentageString, "2.35%")
        let negativePercentageString = NumberFormatter.percentageFormatter.string(for: -2.3452)
        XCTAssertEqual(negativePercentageString, "-2.35%")
    }
    
    func test_priceFormatter() {
        let priceString = NumberFormatter.priceFormatter().string(for: 10231.2313)
        XCTAssertEqual(priceString, "$10,231.23")
    }

}
