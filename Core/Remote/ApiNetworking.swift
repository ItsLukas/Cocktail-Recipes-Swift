import Foundation

public class ApiNetworking: Networking {
	public init() {}

	public func execute(request: Request, handler: @escaping ((Result<Data?, Error>) -> Void)) {
		let task = URLSession.shared.dataTask(with: request.url) { (data: Data?, response: URLResponse?, error: Error?) in

			if let error = error {
				handler(Result.failure(error))
				return
			}

//			guard let response = response else {
//				return
//			}

			guard let data = data else {
				return
			}

			handler(Result.success(data))
		}

		task.resume()
	}
}
