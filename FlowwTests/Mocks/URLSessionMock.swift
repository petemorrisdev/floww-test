import Foundation
@testable import Floww

class URLSessionMock: URLSessionProtocol {
    var data: Data?
    var response = URLResponse()
    var error = URLError(.badServerResponse)
    
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        if let data {
            return (data, response)
        } else {
            throw error
        }
    }
}
