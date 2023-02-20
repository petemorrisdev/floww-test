import XCTest
@testable import Floww

final class MarketCellSearchTests: XCTestCase {

    private var cells: [MarketsCell]!
    
    override func setUp() {
        cells = [
            makeMarketCell(symbol: "BTC"),
            makeMarketCell(symbol: "ETH"),
            makeMarketCell(symbol: "ART"),
            makeMarketCell(symbol: "ABC"),
            makeMarketCell(symbol: "BRG"),
        ]
    }
    
    func test_filterByPrefix() {
        XCTAssertEqual(
            cells.filter(prefix: "B"),
            [makeMarketCell(symbol: "BTC"), makeMarketCell(symbol: "BRG")]
        )
    }
    
    func test_filterByPrefix_isCaseInsensitive() {
        XCTAssertEqual(
            cells.filter(prefix: "e"),
            [makeMarketCell(symbol: "ETH")]
        )
    }
    
    private func makeMarketCell(symbol: String) -> MarketsCell {
        MarketsCell.market(
            LocalizedMarket(
                id: "1",
                image: URL(string: "https://floww.com")!,
                rank: "",
                symbol: symbol,
                price: "",
                marketCap: "",
                priceChange: "",
                positiveChange: true
            )
        )
    }

}
