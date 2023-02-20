import XCTest
@testable import Floww

class MarketDetailStoreMock: MarketDetailStore {
    var localizedMarketChart = LocalizedMarketChart.previewData
    var error: Error?
    
    func fetchMarketChart(id: String, currency: Currency, days: Period, interval: Interval) async throws -> LocalizedMarketChart {
        if let error {
            throw error
        } else {
            return localizedMarketChart
        }
    }
}

final class MarketDetailTests: XCTestCase {

    private var marketDetail: MarketDetail!
    private var store: MarketDetailStoreMock!
    
    override func setUp() {
        store = MarketDetailStoreMock()
        marketDetail = MarketDetail(
            market: LocalizedMarket.previewData[0],
            store: store
        )
    }
    
    func test_fetch() async {
        store.error = nil
        store.localizedMarketChart = LocalizedMarketChart.previewData
        _ = await marketDetail.fetch()
        
        XCTAssertEqual(marketDetail.chart, store.localizedMarketChart)
    }

}
