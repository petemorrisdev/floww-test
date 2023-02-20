import Foundation
@testable import Floww

class CoinAPIMock: CoinAPI {
    var markets: [Market] = []
    var marketChart = MarketChart(prices: [[1.0, 2.0]])
    var error: Error?
    
    func fetchMarkets(currency: Currency, order: Order) async throws -> [Market] {
        if let error {
            throw error
        } else {
            return markets
        }
    }
    
    func fetchMarketChart(id: String, currency: Currency, period: Period, interval: Interval) async throws -> MarketChart {
        if let error {
            throw error
        } else {
            return marketChart
        }
    }
}
