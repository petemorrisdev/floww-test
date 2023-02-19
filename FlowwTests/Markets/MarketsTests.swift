import XCTest
@testable import Floww

final class MarketsTests: XCTestCase {

    private var markets: Markets!
    private var store: MarketsStoreMock!
    
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

}
