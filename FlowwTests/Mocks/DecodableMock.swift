import Foundation

struct MockDecodable: Decodable {
    static let json = """
    {
        "test": "test"
    }
    """
    let test: String
}
