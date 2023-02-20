import Foundation

struct AppFactory {
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
            coinAPI: CoinGeckoAPI(http: HTTPClient(session: URLSession.shared, decoder: CoinGecko.jsonDecoder)),
            marketFormatter: MarketFormatter(currencySymbol: currencySymbol),
            marketChartFormatter: MarketChartFormatter()
        )
    }
}
