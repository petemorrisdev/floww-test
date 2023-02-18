import Foundation

protocol HTTP {
    func get<Response: Decodable>(urlComponents: URLComponents) async throws -> Response
}

protocol URLSessionProtocol {
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}

struct HTTPClient: HTTP {
    let session: URLSessionProtocol
    let decoder: JSONDecoder
    
    func get<Response>(urlComponents: URLComponents) async throws -> Response where Response : Decodable {
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await session.data(from: url, delegate: nil)
        let response = try decoder.decode(Response.self, from: data)
        return response
    }
}
