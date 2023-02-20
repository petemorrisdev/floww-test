import Foundation

struct CoinGeckoAPI: CoinAPI {
    let http: HTTP
    
    func fetchMarkets(currency: Currency, order: Order) async throws -> [Market] {
        try await http.get(
            urlComponents: CoinGecko.FetchMarkets(
                currency: currency,
                order: order,
                perPage: .max
            ).urlComponents
        )
    }
    
    func fetchMarketChart(id: String, currency: Currency, period: Period, interval: Interval) async throws -> MarketChart {
        try await http.get(
            urlComponents: CoinGecko.FetchMarketChart(
                coinID: id,
                currency: currency,
                days: period,
                interval: interval
            ).urlComponents
        )
    }
    
}

