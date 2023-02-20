import Foundation

struct MarketDetailStorePreview: MarketDetailStore {
    func fetchMarketChart(id: String, currency: Currency, days: Period, interval: Interval) async throws -> LocalizedMarketChart {
        LocalizedMarketChart.previewData
    }
}
