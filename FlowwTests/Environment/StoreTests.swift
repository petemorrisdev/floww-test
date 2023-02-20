import XCTest
@testable import Floww

final class StoreTests: XCTestCase {
    
    private var store: Store!
    private var coinAPI: CoinAPIMock!
    private var marketFormatter: MarketFormatter!
    private var marketChartFormatter: MarketChartFormatter!
    
    override func setUp() {
        coinAPI = CoinAPIMock()
        marketFormatter = MarketFormatter(currencySymbol: "$")
        marketChartFormatter = MarketChartFormatter()
        store = Store(
            coinAPI: coinAPI,
            marketFormatter: marketFormatter,
            marketChartFormatter: marketChartFormatter
        )
    }
    
    func test_fetchMarkets() async throws {
        coinAPI.markets = makeMarkets()
        coinAPI.error = nil
        
        let localizedMarkets = try await store.fetchMarkets(currency: .usd, order: .marketCapDescending)
        let expectedLocalizedMarkets =  coinAPI.markets.map(marketFormatter.format(market:))
        XCTAssertEqual(localizedMarkets, expectedLocalizedMarkets)
    }
    
    func test_fetchMarketChart() async throws {
        coinAPI.marketChart = MarketChart(prices: [[1.0, 2.0]])
        coinAPI.error = nil
        
        let localizedMarketChart = try await store.fetchMarketChart(id: "1", currency: .usd, days: .oneYear, interval: .daily)
        let expectedLocalizedMarketChart = marketChartFormatter.format(chart: coinAPI.marketChart)
        XCTAssertEqual(localizedMarketChart, expectedLocalizedMarketChart)
    }
    
    private func makeMarkets() -> [Market] {
        [
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

}
