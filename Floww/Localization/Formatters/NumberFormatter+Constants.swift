import Foundation

extension NumberFormatter {
    private enum Constants {
        static let billion = "B"
        static let defaultSymbol = "$"
        static let percent = "%"
        static let rankPrefix = "#"
    }
    
    /// Formats number to include hash as prefix: #1, #232
    static let marketRankFormatter = {
        let formatter = NumberFormatter()
        formatter.positivePrefix = Constants.rankPrefix
        formatter.negativePrefix = Constants.rankPrefix
        formatter.maximumFractionDigits = .zero
        return formatter
    }()
    
    /// Formats to two decimal places and adds %: 10.0%, -2.34%
    static let percentageFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.positiveSuffix = Constants.percent
        formatter.negativeSuffix = Constants.percent
        return formatter
    }()
    
    /// Formats as USD to two decimal places pre-pended with `currencySymbol`: $10.23, $23,201.00
    static func priceFormatter(currencySymbol: String = Constants.defaultSymbol) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = currencySymbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Formats to one decimal place and appends B: 400.0B, 0.1B
    static func marketCapFormatter(currencySymbol: String = Constants.defaultSymbol) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = currencySymbol
        formatter.maximumFractionDigits = 1
        formatter.positiveSuffix = Constants.billion
        return formatter
    }
}
