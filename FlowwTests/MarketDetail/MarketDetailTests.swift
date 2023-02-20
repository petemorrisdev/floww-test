import XCTest
@testable import Floww

final class MarketDetailTests: XCTestCase {

    private var marketDetail: MarketDetail!
    private var store: MarketDetailStoreMock!
    private var errorMessage = "Test error"
    
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
        await marketDetail.fetch()
        
        XCTAssertEqual(marketDetail.chart, store.localizedMarketChart)
    }
    
    func test_fetchError() async {
        store.error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorMessage])
        await marketDetail.fetch()
        
        XCTAssertEqual(marketDetail.errorMessage, errorMessage)
        XCTAssertNil(marketDetail.chart)
    }
    
    func test_fetchRefresh_afterError() async {
        store.error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorMessage])
        await marketDetail.fetch()
        
        store.error = nil
        store.localizedMarketChart = LocalizedMarketChart.previewData
        await marketDetail.fetch()
        
        XCTAssertEqual(marketDetail.chart, store.localizedMarketChart)
        XCTAssertNil(marketDetail.errorMessage)
        
    }
}
