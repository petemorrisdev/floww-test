import Foundation
@testable import Floww

class MarketDetailStoreMock: MarketDetailStore {
    var localizedMarketChart = LocalizedMarketChart.previewData
    var error: Error?
    
    func fetchMarketChart(id: String, currency: Currency, days: Period, interval: Interval) async throws -> LocalizedMarketChart {
        if let error {
            throw error
        } else {
            return localizedMarketChart
        }
    }
}
