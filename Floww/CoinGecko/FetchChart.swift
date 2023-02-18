import Foundation

extension CoinGecko {
    struct FetchMarketChart: EndPoint {
        let path: String
        let queryItems: [URLQueryItem]
        
        init(coinID: String, currency: Currency, days: Period, interval: Interval) {
            path = CoinGecko.Path.marketChart(id: coinID)
            queryItems = [
                URLQueryItem(name: currency.paramName, value: currency.paramValue),
                URLQueryItem(name: days.paramName, value: days.paramValue),
                URLQueryItem(name: interval.paramName, value: interval.paramValue),
            ]
        }
    }
}
