import Foundation

struct MarketFormatter {
    private let marketRankFormatter = NumberFormatter.marketRankFormatter
    private let percentageFormatter = NumberFormatter.percentageFormatter
    private let priceFormatter: NumberFormatter
    private let marketCapFormatter: NumberFormatter
    
    init(currencySymbol: String) {
        priceFormatter = NumberFormatter.priceFormatter(currencySymbol: currencySymbol)
        marketCapFormatter = NumberFormatter.marketCapFormatter(currencySymbol: currencySymbol)
    }
    
    func format(market: Market) -> LocalizedMarket {
        LocalizedMarket(
            id: market.id,
            image: URL(string: market.image)!,
            rank: marketRankFormatter.string(for: market.marketCapRank) ?? "",
            symbol: market.symbol.uppercased(),
            price: priceFormatter.string(for: market.currentPrice) ?? "",
            marketCap: marketCapString(for: market),
            priceChange: percentageFormatter.string(for: market.priceChange) ?? "",
            positiveChange: market.priceChange >= .zero
        )
    }
    
    private func marketCapString(for market: Market) -> String {
        // Assuming here that it will always make sense for the markets viewed in
        // the app to be judged in terms of billions.
        //
        // It may make sense to improve this in future if the marktes list is paginated.
        // Have captured this future improvement in this issue:
        //
        // https://github.com/petemorrisdev/floww-test/issues/8
        return marketCapFormatter.string(for: market.marketCap.numberOfBillions) ?? ""
    }
    
}
