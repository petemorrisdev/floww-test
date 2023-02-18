import Foundation
@testable import Floww

struct EndPointMock: EndPoint {
    let scheme = "https"
    let host = "floww.com"
    let path = "/api/test"
    let queryItems = [URLQueryItem(name: "test_param", value: "test_value")]
}
