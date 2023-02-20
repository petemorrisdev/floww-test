import Foundation

protocol CoinAPI {
    func fetchMarkets(currency: Currency, order: Order) async throws -> [Market]
    func fetchMarketChart(id: String, currency: Currency, period: Period, interval: Interval) async throws -> MarketChart
}
