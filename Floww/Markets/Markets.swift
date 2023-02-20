import Foundation

protocol MarketsStore {
    func fetchMarkets(currency: Currency, order: Order) async throws -> [LocalizedMarket]
}

struct Markets {
    private(set) var cells: [MarketsCell] = [.loading]
    private(set) var errorMessage: String?
    private let store: MarketsStore
    
    init(store: MarketsStore) {
        self.store = store
    }
    
    mutating func fetch() async {
        do {
            cells = try await store.fetchMarkets(
                currency: .usd,
                order: .marketCapDescending
            )
            .map(MarketsCell.market)
            errorMessage = nil
        } catch {
            if cells == [.loading] {
                cells = [.pullToRefresh]
            }
            errorMessage = error.localizedDescription
        }
    }
}
