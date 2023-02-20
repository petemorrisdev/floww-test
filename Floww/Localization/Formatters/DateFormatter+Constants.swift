import Foundation

extension DateFormatter {
    static let short = {
        var formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}
