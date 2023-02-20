import Foundation

protocol MarketDetailStore {
    func fetchMarketChart(id: String, currency: Currency, days: Period, interval: Interval) async throws -> LocalizedMarketChart
}

struct MarketDetail {
    let market: LocalizedMarket
    private(set) var chart: LocalizedMarketChart?
    private let store: MarketDetailStore
    private let dateFormatter: DateFormatter
    
    var date: String {
        dateFormatter.string(from: Date())
    }
    
    init(
        market: LocalizedMarket,
        store: MarketDetailStore,
        dateFormatter: DateFormatter = .short
    ) {
        self.market = market
        self.store = store
        self.dateFormatter = dateFormatter
    }
    
    mutating func fetch() async {
        do {
            chart = try await store.fetchMarketChart(
                id: market.id,
                currency: .usd,
                days: .oneYear,
                interval: .daily
            )
        } catch {
            // TODO: Error handling: https://github.com/petemorrisdev/floww-test/issues/15
        }
    }
    
}
