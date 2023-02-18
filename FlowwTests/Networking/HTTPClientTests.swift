import XCTest
@testable import Floww

final class HTTPClientTests: XCTestCase {

    private var httpClient: HTTPClient!
    private var session: URLSessionMock!
    
    override func setUp() {
        session = URLSessionMock()
        httpClient = HTTPClient(session: session, decoder: JSONDecoder())
    }
    
    func test_get_withInvalidURLComponents_throwsBadURLError() async {
        do {
            let _: MockDecodable = try await httpClient.get(urlComponents: URLComponents.invalid)
            XCTFail()
        } catch {
            XCTAssertEqual(error as? URLError, URLError(.badURL))
        }
    }
    
    func test_get_decodesResponse() async throws {
        session.data = MockDecodable.json.data(using: .utf8)
        let response: MockDecodable = try await httpClient.get(urlComponents: URLComponents.valid)
        
        XCTAssertNotNil(response)
    }

}
