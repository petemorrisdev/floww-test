import Foundation
@testable import Floww

class MarketsStoreMock: MarketsStore {
    var markets: [LocalizedMarket] = []
    var error: Error?
    
    func fetchMarkets(currency: Currency, order: Order) async throws -> [LocalizedMarket] {
        if let error {
            throw error
        } else {
            return markets
        }
    }
}
