import Foundation

#if DEBUG
extension LocalizedMarket {
    static let previewData = [
        LocalizedMarket(id: "1", image: URL(string: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579")!, rank: "#1", symbol: "BTC", price: "$24620.00", marketCap: "474.2B", priceChange: "1.5%", positiveChange: true),
        LocalizedMarket(id: "2", image: URL(string: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880")!, rank: "#2", symbol: "ETH", price: "$1689.00", marketCap: "203.0B", priceChange: "-1.2%", positiveChange: false),
        LocalizedMarket(id: "3", image: URL(string: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579")!, rank: "#3", symbol: "ATH", price: "$24620.00", marketCap: "474.2B", priceChange: "1.5%", positiveChange: true),
        LocalizedMarket(id: "4", image: URL(string: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880")!, rank: "#4", symbol: "ETC", price: "$1689.00", marketCap: "203.0B", priceChange: "-1.2%", positiveChange: false),
        LocalizedMarket(id: "5", image: URL(string: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579")!, rank: "#5", symbol: "NBC", price: "$24620.00", marketCap: "474.2B", priceChange: "1.5%", positiveChange: true),
        LocalizedMarket(id: "6", image: URL(string: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880")!, rank: "#6", symbol: "BAR", price: "$1689.00", marketCap: "203.0B", priceChange: "-1.2%", positiveChange: false),
    ]
}
#endif
