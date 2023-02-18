import XCTest
@testable import Floww

final class CoinGeckoTests: XCTestCase {

    func test_marketChartPath() {
        let path = CoinGecko.Path.marketChart(id: "test_id")
        XCTAssertEqual(path, "/api/v3/coins/test_id/market_chart")
    }
    
    func test_fetchMarketsURL() throws {
        let urlComponents = CoinGecko.FetchMarkets(
            currency: .usd,
            order: .marketCapDescending,
            perPage: .max
        ).urlComponents
        
        let expectedURL = try XCTUnwrap(URL(string: """
        https://api.coingecko.com\
        /api/v3/coins/markets\
        ?vs_currency=usd&order=market_cap_desc&per_page=250
        """))
        
        XCTAssertEqual(urlComponents.url, expectedURL)
    }
    
    func test_fetchMarketChartURL() throws {
        let urlComponents = CoinGecko.FetchMarketChart(
            coinID: "test_id",
            currency: .usd,
            days: .oneYear,
            interval: .daily
        ).urlComponents
        
        let expectedURL = try XCTUnwrap(URL(string:"""
        https://api.coingecko.com\
        /api/v3/coins/test_id/market_chart\
        ?vs_currency=usd&days=365&interval=daily
        """))
        
        XCTAssertEqual(urlComponents.url, expectedURL)
    }
    
    func test_currencyParameters() {
        XCTAssertEqual(Currency.usd.paramName, CoinGecko.Param.currency)
        XCTAssertEqual(Currency.usd.paramValue, CoinGecko.Value.usd)
    }
    
    func test_orderParameters() {
        XCTAssertEqual(Order.marketCapDescending.paramName, CoinGecko.Param.order)
        XCTAssertEqual(Order.marketCapDescending.paramValue, CoinGecko.Value.marketCapDescending)
    }
    
    func test_intervalParameters() {
        XCTAssertEqual(Interval.daily.paramName, CoinGecko.Param.interval)
        XCTAssertEqual(Interval.daily.paramValue, CoinGecko.Value.daily)
    }
    
    func test_periodParameters() {
        XCTAssertEqual(Period.oneYear.paramName, CoinGecko.Param.days)
        XCTAssertEqual(Period.oneYear.paramValue, CoinGecko.Value.oneYear)
    }

}
