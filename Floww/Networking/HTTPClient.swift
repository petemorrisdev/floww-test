import Foundation

protocol HTTP {
    func get<Response: Decodable>(urlComponents: URLComponents) async throws -> Response
}

protocol URLSessionProtocol {
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}

struct HTTPClient: HTTP {
    enum Errors: Error {
        case unsuccessful(body: Data, status: Int)
    }
    
    let session: URLSessionProtocol
    let decoder: JSONDecoder
    
    func get<Response>(urlComponents: URLComponents) async throws -> Response where Response : Decodable {
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await session.data(from: url, delegate: nil)
        let statusCode = (response as? HTTPURLResponse)?.statusCode ?? .zero
        
        if (response as? HTTPURLResponse)?.statusCode == 200 {
            return try decoder.decode(Response.self, from: data)
        } else {
            throw Errors.unsuccessful(body: data, status: statusCode)
        }
    }
}

