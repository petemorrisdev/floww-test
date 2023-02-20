import Foundation

struct LocalizedMarketChart: Equatable {
    struct Mark: Identifiable, Equatable {
        var id: Date { date }
        let xLabel: String
        let yLabel: String
        let date: Date
        let price: Double
    }
    
    let marks: [Mark]
}
