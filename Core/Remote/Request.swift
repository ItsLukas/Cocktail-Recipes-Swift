import Foundation

public struct Request {
	public let url: URL
    public let method: HTTPMethod
    public let parameters: [String: Any]?
    public let headers: [String: String]?

    public init(url: URL, method: HTTPMethod, parameters: [String: Any]? = nil, headers: [String: String]? = nil) {
        self.url = url
        self.method = method
        self.parameters = parameters
        self.headers = headers
    }
}
