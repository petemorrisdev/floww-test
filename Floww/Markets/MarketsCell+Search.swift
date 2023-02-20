import Foundation

extension Array where Element == MarketsCell {
    func filter(prefix: String) -> [MarketsCell] {
        guard let regex = try? Regex(prefix.lowercased()) else {
            return self
        }
        
        return self.filter { cell in
            switch cell {
            case let .market(localizedMarket):
                return localizedMarket.symbol.lowercased().prefixMatch(of: regex) != nil
            default:
                return false
            }
        }
    }
}
