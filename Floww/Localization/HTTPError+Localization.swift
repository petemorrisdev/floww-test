import Foundation

extension HTTPClient.Errors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case let .unsuccessful(_, status) where status == 429:
            return "You've exceeded the rete limit. Please wait for a few minutes and try again"
        default:
            return "Something went wrong"
        }
    }
}
