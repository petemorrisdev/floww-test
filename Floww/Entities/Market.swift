import Foundation

struct Market: Decodable {
    let id: String
    let symbol: String
    let marketCap: Int
    // Have seen occassional responses from CoinGecko where `marketCapRank`
    // or `priceChangePercentage24H` have been `null. Making them optional
    // to handle this gracefully.
    let marketCapRank: Int?
    let priceChangePercentage24H: Double?
    let image: String
    let currentPrice: Double
    
    var rank: Int {
        marketCapRank ?? .zero
    }
    
    var priceChange: Double {
        priceChangePercentage24H ?? .zero
    }
}
