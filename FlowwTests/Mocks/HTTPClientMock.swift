import Foundation
@testable import Floww

class HTTPClientMock: HTTP {
    enum Errors: Error {
        case defaultError
    }
    
    var response: Decodable?
    var error: Error?
    private(set) var urlComponents: URLComponents?
    
    func get<Response>(urlComponents: URLComponents) async throws -> Response where Response : Decodable {
        self.urlComponents = urlComponents
        if let response = response as? Response {
            return response
        } else {
            throw error ?? Errors.defaultError
        }
    }
}
