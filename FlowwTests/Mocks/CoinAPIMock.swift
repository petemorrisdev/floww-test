import Foundation
@testable import Floww

class CoinAPIMock: CoinAPI {
    var markets: [Market] = []
    var error: Error?
    
    func fetchMarkets(currency: Currency, order: Order) async throws -> [Market] {
        if let error {
            throw error
        } else {
            return markets
        }
    }
}
