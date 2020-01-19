import Foundation

public protocol Networking {
	func execute(request: Request, handler: @escaping ((Result<Data?, Error>) -> Void))
}
