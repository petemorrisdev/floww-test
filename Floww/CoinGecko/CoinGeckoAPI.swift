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
    
}
