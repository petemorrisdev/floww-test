import XCTest
@testable import Floww

final class MarketsTests: XCTestCase {

    private var markets: Markets!
    private var store: MarketsStoreMock!
    private var errorMessage = "Test error"
    
    override func setUp() {
        store = MarketsStoreMock()
        markets = Markets(store: store)
    }
    
    func test_initialState_showsLoading() {
        XCTAssertEqual(markets.cells, [.loading])
    }
    
    func test_fetchSuccess() async {
        store.markets = LocalizedMarket.previewData
        store.error = nil
        await markets.fetch()
        
        let expectedCells = store.markets.map(MarketsCell.market)
        
        XCTAssertEqual(markets.cells, expectedCells)
    }
    
    func test_fetchError() async {
        store.error = NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: errorMessage])
        await markets.fetch()
        
        XCTAssertEqual(markets.errorMessage, errorMessage)
        XCTAssertEqual(markets.cells, [.pullToRefresh])
    }
    
    func test_fetchRefresh_afterError() async {
        store.error = NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: errorMessage])
        await markets.fetch()
        
        store.error = nil
        store.markets = LocalizedMarket.previewData
        await markets.fetch()
        
        let expectedCells = store.markets.map(MarketsCell.market)
        
        XCTAssertEqual(markets.cells, expectedCells)
        XCTAssertNil(markets.errorMessage)
        
    }

}
