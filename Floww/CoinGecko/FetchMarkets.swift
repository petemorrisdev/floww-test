import Foundation

extension CoinGecko {
    struct FetchMarkets: EndPoint {
        let path = CoinGecko.Path.markets
        let queryItems: [URLQueryItem]
        
        init(currency: Currency, order: Order, perPage: CoinGecko.PerPage) {
            queryItems = [
                URLQueryItem(name: currency.paramName, value: currency.paramValue),
                URLQueryItem(name: order.paramName, value: order.paramValue),
                URLQueryItem(name: perPage.name, value: perPage.rawValue),
            ]
        }
    }
}
