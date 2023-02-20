import XCTest
@testable import Floww

final class CoinGeckAPITests: XCTestCase {

    private var coinGeckoAPI: CoinGeckoAPI!
    private var http: HTTPClientMock!
    
    override func setUp() {
        http = HTTPClientMock()
        coinGeckoAPI = CoinGeckoAPI(http: http)
    }
    
    func test_fetchMarkets() async throws {
        http.error = nil
        http.response = [Market(
            id: "",
            symbol: "",
            marketCap: 1,
            marketCapRank: 1,
            priceChangePercentage24H: 1.0,
            image: "",
            currentPrice: 1.0
        )]
        
        _ = try await coinGeckoAPI.fetchMarkets(currency: .usd, order: .marketCapDescending)
        
        let expectedURLComponents = CoinGecko.FetchMarkets(
            currency: .usd,
            order: .marketCapDescending,
            perPage: .max
        ).urlComponents
        
        XCTAssertEqual(http.urlComponents, expectedURLComponents)
    }
    
    func test_fetchMarketChart() async throws {
        http.error = nil
        http.response = MarketChart(prices: [[1.0, 2.0]])
        
        let coinID = "1"
        _ = try await coinGeckoAPI.fetchMarketChart(id: coinID, currency: .usd, period: .oneYear, interval: .daily)
        
        let expectedURLComponents = CoinGecko.FetchMarketChart(
            coinID: coinID,
            currency: .usd,
            days: .oneYear,
            interval: .daily
        ).urlComponents
        
        XCTAssertEqual(http.urlComponents, expectedURLComponents)
    }

}
