import Foundation

struct Store {
    let coinAPI: CoinAPI
    let marketFormatter: MarketFormatter
    let marketChartFormatter: MarketChartFormatter
}

extension Store: MarketsStore {
    func fetchMarkets(currency: Currency, order: Order) async throws -> [LocalizedMarket] {
        try await coinAPI
            .fetchMarkets(currency: currency, order: order)
            .map(marketFormatter.format(market:))
    }
}

extension Store: MarketDetailStore {
    func fetchMarketChart(
        id: String,
        currency: Currency,
        days: Period,
        interval: Interval
    ) async throws -> LocalizedMarketChart {
        let chart = try await coinAPI.fetchMarketChart(id: id, currency: currency, period: days, interval: interval)
        return marketChartFormatter.format(chart: chart)
    }
}
