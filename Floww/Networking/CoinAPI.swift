import Foundation

protocol CoinAPI {
    func fetchMarkets(currency: Currency, order: Order) async throws -> [Market]
}
