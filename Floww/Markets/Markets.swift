import Foundation

protocol MarketsStore {
    func fetchMarkets(currency: Currency, order: Order) async throws -> [LocalizedMarket]
}

struct Markets {
    private(set) var cells: [MarketsCell] = [.loading]
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
        } catch {
            // TODO: Error handling: https://github.com/petemorrisdev/floww-test/issues/15
            print(error)
        }
    }
}
