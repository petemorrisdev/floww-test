import Foundation

struct LocalizedMarket: Equatable, Identifiable {
    let id: String
    let image: URL
    let rank: String
    let symbol: String
    let price: String
    let marketCap: String
    let priceChange: String
    let positiveChange: Bool
}
