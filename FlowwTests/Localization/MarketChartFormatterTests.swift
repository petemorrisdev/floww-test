import XCTest
@testable import Floww

final class MarketChartFormatterTests: XCTestCase {

    private var formatter: MarketChartFormatter!
    private var chart: MarketChart!
    private var timestampMilliseconds = 1645315200000.0
    private var timestampSeconds = 1645315200.0
    private var price = 40192.75912143141
    
    override func setUp() {
        formatter = MarketChartFormatter()
        chart = MarketChart(prices: [[timestampMilliseconds, price],])
    }
    
    func test_format() {
        let localizedMarketChart = formatter.format(chart: chart)
        
        XCTAssertEqual(localizedMarketChart.marks.count, 1)
        XCTAssertEqual(localizedMarketChart.marks[0].xLabel, "Date")
        XCTAssertEqual(localizedMarketChart.marks[0].yLabel, "Price")
        XCTAssertEqual(localizedMarketChart.marks[0].date, Date(timeIntervalSince1970: timestampSeconds))
        XCTAssertEqual(localizedMarketChart.marks[0].price, price)
    }

}
