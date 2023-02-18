import Foundation
@testable import Floww

extension Market {
    static let testData = """
    {
        "id": "bitcoin",
        "symbol": "btc",
        "name": "Bitcoin",
        "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        "current_price": 24672,
        "market_cap": 473955841961,
        "market_cap_rank": 1,
        "fully_diluted_valuation": 515856106852,
        "total_volume": 51899892533,
        "high_24h": 24949,
        "low_24h": 23637,
        "price_change_24h": 939.8,
        "price_change_percentage_24h": 3.96003,
        "market_cap_change_24h": 17141601567,
        "market_cap_change_percentage_24h": 3.75242,
        "circulating_supply": 19294281,
        "total_supply": 21000000,
        "max_supply": 21000000,
        "ath": 69045,
        "ath_change_percentage": -64.28164,
        "ath_date": "2021-11-10T14:24:11.849Z",
        "atl": 67.81,
        "atl_change_percentage": 36269.29745,
        "atl_date": "2013-07-06T00:00:00.000Z",
        "roi": null,
        "last_updated": "2023-02-18T01:14:03.490Z"
      }
    """.data(using: .utf8)
}
