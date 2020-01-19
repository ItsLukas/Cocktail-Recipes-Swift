import Foundation
import Core
import Domain

class CocktailListService {

    private let baseUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
    private let networking: Networking

    init(networking: Networking) {
        self.networking = networking
    }

	func fetchList(filter: String?, completionHandler: @escaping ((Result<[Cocktail], Error>) -> Void)) {

        guard let urlComponents = NSURLComponents(string: baseUrl) else {
            return
        }

		if filter != nil {
			urlComponents.queryItems = [
			  URLQueryItem(name: "f", value: filter!)
			]
		}

		guard let url = urlComponents.url else {
            return
        }

        let request = Request(url: url, method: .get)

        networking.execute(request: request) { result in
            switch result {
            case .success(let data):
                guard let data = data else {
                    return
                }
                print("Network result complete")
                do {
                    let response = try JSONDecoder().decode(CocktailsResponse.self, from: data)
                    completionHandler(Result.success(response.drinks))
                } catch let error {
                    completionHandler(Result.failure(error))
                }
            case .failure(let error):
                print("Network error: \(error.localizedDescription)")
                completionHandler(Result.failure(error))
            }

        }
    }

}
