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
    
    func test_unsuccessfulResponse() async throws {
        let response = try XCTUnwrap(
            HTTPURLResponse(
                url: try XCTUnwrap(URL(string: "https://floww.com")),
                statusCode: 400,
                httpVersion: nil,
                headerFields: nil
            )
        )
        session.response = response
        session.data = "Error".data(using: .utf8)
        
        do {
            let _: MockDecodable = try await httpClient.get(urlComponents: URLComponents.valid)
            XCTFail()
        } catch {
            switch error {
            case let HTTPClient.Errors.unsuccessful(body, status):
                XCTAssertEqual(body, session.data)
                XCTAssertEqual(status, 400)
            default:
                XCTFail()
            }
        }
    }

}
