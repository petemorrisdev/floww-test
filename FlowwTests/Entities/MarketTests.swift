import XCTest
@testable import Floww

final class MarketTests: XCTestCase {

    private var jsonDecoder: JSONDecoder!
    private var marketData: Data!
    
    override func setUp() {
        jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        marketData = Market.testData
    }
    
    func test_decodeMarket() throws {
        let market = try jsonDecoder.decode(Market.self, from: marketData)
        XCTAssertNotNil(market)
    }

}
