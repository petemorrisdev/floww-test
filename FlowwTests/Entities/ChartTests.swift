import XCTest
@testable import Floww

final class ChartTests: XCTestCase {

    private var jsonDecoder: JSONDecoder!
    private var chartData: Data!
    
    override func setUp() {
        jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        chartData = MarketChart.testData
    }
    
    func test_decodeChart() throws {
        let market = try jsonDecoder.decode(MarketChart.self, from: chartData)
        XCTAssertNotNil(market)
    }

}
