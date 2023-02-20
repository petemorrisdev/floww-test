import Foundation

enum MarketsCell: Identifiable, Equatable {
    case loading
    case market(LocalizedMarket)
    case pullToRefresh
    
    var id: String {
        switch self {
        case .loading: return UUID().uuidString
        case let .market(market): return market.id
        case .pullToRefresh: return UUID().uuidString
        }
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading): return true
        case (.pullToRefresh, .pullToRefresh): return true
        default: return lhs.id == rhs.id
        }
    }
}
