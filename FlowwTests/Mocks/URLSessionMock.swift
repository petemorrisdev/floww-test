import Foundation
@testable import Floww

class URLSessionMock: URLSessionProtocol {
    var data: Data?
    var response = HTTPURLResponse(
        url: URL(string: "https://floww.com")!,
        statusCode: 200,
        httpVersion: nil,
        headerFields: nil
    )
    var error = URLError(.badServerResponse)
    
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        if let data, let response {
            return (data, response)
        } else {
            throw error
        }
    }
}
