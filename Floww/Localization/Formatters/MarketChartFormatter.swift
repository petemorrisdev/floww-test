import Foundation

struct MarketChartFormatter {

    func format(chart: MarketChart) -> LocalizedMarketChart {
        LocalizedMarketChart(marks: chart.prices.compactMap(makeMark))
    }
    
    private func makeMark(_ data: [Double]) -> LocalizedMarketChart.Mark? {
        guard let timestamp = data.first, let price = data.last else {
            return nil
        }
        
        return LocalizedMarketChart.Mark(
            xLabel: "Date",
            yLabel: "Price",
            date: Date(timeIntervalSince1970: timestamp / 1000),
            price: price
        )
    }
}
