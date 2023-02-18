import XCTest
@testable import Floww

final class EndPointTests: XCTestCase {
    
    private var endPoint: EndPoint!
    
    override func setUp() {
        endPoint = EndPointMock()
    }

    func test_urlComponents() {
        let urlComponents = endPoint.urlComponents
        XCTAssertEqual(urlComponents.scheme, endPoint.scheme)
        XCTAssertEqual(urlComponents.host, endPoint.host)
        XCTAssertEqual(urlComponents.path, endPoint.path)
        XCTAssertEqual(urlComponents.queryItems, endPoint.queryItems)
    }

}
