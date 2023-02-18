import Foundation

enum CoinGecko {
    static let scheme = "https"
    static let host = "api.coingecko.com"
    
    enum Path {
        static let markets = "/api/v3/coins/markets"
        static func marketChart(id: String) -> String { "/api/v3/coins/\(id)/market_chart" }
    }
    
    enum Param {
        static let currency = "vs_currency"
        static let order = "order"
        static let interval = "interval"
        static let days = "days"
    }
    
    enum Value {
        static let usd = "usd"
        static let marketCapDescending = "market_cap_desc"
        static let daily = "daily"
        static let oneYear = "365"
    }
    
    enum PerPage: String {
        case max = "250"
        var name: String { "per_page" }
    }

}
