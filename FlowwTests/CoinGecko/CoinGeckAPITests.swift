import XCTest
@testable import Floww

final class CoinGeckAPITests: XCTestCase {

    private var coinGeckoAPI: CoinGeckoAPI!
    private var http: HTTPClientMock!
    private var response: [Market]!
    
    override func setUp() {
        http = HTTPClientMock()
        coinGeckoAPI = CoinGeckoAPI(http: http)
        response = [Market(
            id: "",
            symbol: "",
            marketCap: 1,
            marketCapRank: 1,
            priceChangePercentage24H: 1.0,
            image: "",
            currentPrice: 1.0
        )]
    }
    
    func test_fetchMarkets() async throws {
        http.response = response
        http.error = nil
        
        _ = try await coinGeckoAPI.fetchMarkets(currency: .usd, order: .marketCapDescending)
        
        let expectedURLComponents = CoinGecko.FetchMarkets(
            currency: .usd,
            order: .marketCapDescending,
            perPage: .max
        ).urlComponents
        
        XCTAssertEqual(http.urlComponents, expectedURLComponents)
    }

}
