import Foundation

extension HTTPClient.Errors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case let .unsuccessful(_, status) where status == 429:
            return NSLocalizedString("rateLimitError", comment: "")
        default:
            return  NSLocalizedString("fallbackError", comment: "")
        }
    }
}
