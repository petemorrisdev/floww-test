import SwiftUI

struct LocalizedMarketChart: Equatable {
    struct Mark: Identifiable, Equatable {
        var id: Date { date }
        let xLabel: LocalizedStringKey
        let yLabel: LocalizedStringKey
        let date: Date
        let price: Double
    }
    
    let marks: [Mark]
}
