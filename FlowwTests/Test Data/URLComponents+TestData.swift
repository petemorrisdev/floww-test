import Foundation

extension URLComponents {
    static var valid: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.host = "floww.com"
        urlComponents.path = "/api/test"
        return urlComponents
    }
    
    static var invalid: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.host = "floww.com"
        urlComponents.path = "api/test"
        return urlComponents
    }
}
