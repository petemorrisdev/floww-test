import Foundation

struct MarketsStorePreview: MarketsStore {
    func fetchMarkets(currency: Currency, order: Order) async throws -> [LocalizedMarket] {
        LocalizedMarket.previewData
    }
}
