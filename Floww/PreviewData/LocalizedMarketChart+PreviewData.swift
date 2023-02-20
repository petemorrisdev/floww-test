import Foundation

#if DEBUG
extension LocalizedMarketChart {
    static let oneDay = Double(60 * 60 * 24)
    static let previewData = LocalizedMarketChart(
        marks: [
            .init(xLabel: "Date", yLabel: "Price", date: Date().addingTimeInterval(-(oneDay * 10.0)), price: 24.5),
            .init(xLabel: "Date", yLabel: "Price", date: Date().addingTimeInterval(-(oneDay * 9.0)), price: 30.4),
            .init(xLabel: "Date", yLabel: "Price", date: Date().addingTimeInterval(-(oneDay * 8.0)), price: 12.8),
            .init(xLabel: "Date", yLabel: "Price", date: Date().addingTimeInterval(-(oneDay * 7.0)), price: 15.9),
            .init(xLabel: "Date", yLabel: "Price", date: Date().addingTimeInterval(-(oneDay * 6.0)), price: 13.0),
            .init(xLabel: "Date", yLabel: "Price", date: Date().addingTimeInterval(-(oneDay * 5.0)), price: 42.0),
            .init(xLabel: "Date", yLabel: "Price", date: Date().addingTimeInterval(-(oneDay * 4.0)), price: 32.0),
            .init(xLabel: "Date", yLabel: "Price", date: Date().addingTimeInterval(-(oneDay * 3.0)), price: 12.0),
            .init(xLabel: "Date", yLabel: "Price", date: Date().addingTimeInterval(-(oneDay * 2.0)), price: 42.0),
            .init(xLabel: "Date", yLabel: "Price", date: Date().addingTimeInterval(-(oneDay * 1.0)), price: 12.4),
            .init(xLabel: "Date", yLabel: "Price", date: Date(), price: 11.5),]
    )
}
#endif
