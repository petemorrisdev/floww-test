import Foundation

struct AppFactory {
    
    private var urlSession: URLSession {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        config.timeoutIntervalForRequest = 20.0
        return URLSession(configuration: config)
    }
    
    func makeMarkets(currencySymbol: String = "$") -> Markets {
        Markets(store: makeStore(currencySymbol: currencySymbol))
    }
    
    func makeMarketChart(market: LocalizedMarket, currencySymbol: String = "$") -> MarketDetail {
        MarketDetail(
            market: market,
            store: makeStore(currencySymbol: currencySymbol)
        )
    }
    
    private func makeStore(currencySymbol: String) -> Store {
        Store(
            coinAPI: CoinGeckoAPI(http: HTTPClient(session: urlSession, decoder: CoinGecko.jsonDecoder)),
            marketFormatter: MarketFormatter(currencySymbol: currencySymbol),
            marketChartFormatter: MarketChartFormatter()
        )
    }
}
