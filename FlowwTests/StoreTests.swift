import XCTest
@testable import Floww

final class StoreTests: XCTestCase {
    
    private var store: Store!
    private var coinAPI: CoinAPIMock!
    private var formatter: MarketFormatter!
    private var markets: [Market]!
    
    override func setUp() {
        coinAPI = CoinAPIMock()
        formatter = MarketFormatter(currencySymbol: "$")
        store = Store(coinAPI: coinAPI, marketFormatter: formatter)
        markets = [
            Market(
                id: "1",
                symbol: "BTC",
                marketCap: 10,
                marketCapRank: 1,
                priceChangePercentage24H: 1.5,
                image: "https://floww.com/image.jpg",
                currentPrice: 20.0
            ),
            Market(
                id: "2",
                symbol: "ETH",
                marketCap: 10,
                marketCapRank: 1,
                priceChangePercentage24H: 1.5,
                image: "https://floww.com/image.jpg",
                currentPrice: 20.0
            ),
        ]
    }
    
    func test_fetchMarkets() async throws {
        coinAPI.markets = markets
        coinAPI.error = nil
        
        let localizedMarkets = try await store.fetchMarkets(currency: .usd, order: .marketCapDescending)
        
        let expectedLocalizedMarkets = markets.map(formatter.format(market:))
        
        XCTAssertEqual(localizedMarkets, expectedLocalizedMarkets)
        
    }

}
