import Foundation

enum MarketsCell: Identifiable, Equatable {
    case loading
    case market(LocalizedMarket)
    
    var id: String {
        switch self {
        case .loading: return UUID().uuidString
        case let .market(market): return market.id
        }
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading): return true
        default: return lhs.id == rhs.id
        }
    }
}
