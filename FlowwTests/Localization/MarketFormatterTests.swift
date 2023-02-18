import XCTest
@testable import Floww

final class MarketFormatterTests: XCTestCase {

    private var formatter: MarketFormatter!
    private var marketPositivePriceChange: Market!
    private var marketNegativePriceChange: Market!
    private let currencySymbol = "USD"
    
    override func setUp() {
        formatter = MarketFormatter(currencySymbol: currencySymbol)
        marketPositivePriceChange = Market(
            id: UUID().uuidString,
            symbol: "test_symbol",
            marketCap: 912000000000,
            marketCapRank: 12,
            priceChangePercentage24H: 12,
            image: "https://floww.com/image.jpg",
            currentPrice: 21231.00
        )
        marketNegativePriceChange = Market(
            id: UUID().uuidString,
            symbol: "test_symbol",
            marketCap: 912000000000,
            marketCapRank: 12,
            priceChangePercentage24H: -4,
            image: "https://floww.com/image.jpg",
            currentPrice: 21231.00
        )
    }
    
    func test_formatMarket() throws {
        let localizedMarket = formatter.format(market: marketPositivePriceChange)
        let imageURL = try XCTUnwrap(URL(string: marketPositivePriceChange.image))
        XCTAssertEqual(localizedMarket.id, marketPositivePriceChange.id)
        XCTAssertEqual(localizedMarket.image, imageURL)
        XCTAssertEqual(localizedMarket.rank, NumberFormatter.marketRankFormatter.string(for: marketPositivePriceChange.marketCapRank))
        XCTAssertEqual(localizedMarket.marketCap, NumberFormatter.marketCapFormatter(currencySymbol: currencySymbol).string(for: marketPositivePriceChange.marketCap.numberOfBillions))
        XCTAssertEqual(localizedMarket.symbol, marketPositivePriceChange.symbol.uppercased())
        XCTAssertEqual(localizedMarket.price, NumberFormatter.priceFormatter(currencySymbol: currencySymbol).string(for: marketPositivePriceChange.currentPrice))
        XCTAssertEqual(localizedMarket.priceChange, NumberFormatter.percentageFormatter.string(for: marketPositivePriceChange.priceChange))
        XCTAssertTrue(localizedMarket.positiveChange)
    }
    
    func test_formatMarket_negativePriceChange() {
        let localizedMarket = formatter.format(market: marketNegativePriceChange)
        XCTAssertFalse(localizedMarket.positiveChange)
    }

}
