import Foundation

struct Store {
    let coinAPI: CoinAPI
    let marketFormatter: MarketFormatter
}

extension Store: MarketsStore {
    func fetchMarkets(currency: Currency, order: Order) async throws -> [LocalizedMarket] {
        try await coinAPI
            .fetchMarkets(currency: currency, order: order)
            .map(marketFormatter.format(market:))
    }
}
