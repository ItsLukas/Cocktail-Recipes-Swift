import Foundation
import Core
import Domain

public class CocktailDetailsService {

    private let baseUrl = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php"
    private let networking: Networking

    public init(networking: Networking) {
        self.networking = networking
    }

	func fetchDetails(cocktailId: String, completionHandler: @escaping ((Result<[Cocktail], Error>) -> Void)) {

		guard let urlComponents = NSURLComponents(string: baseUrl) else {
            return
        }

		urlComponents.queryItems = [
		  URLQueryItem(name: "i", value: cocktailId)
		]

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
                    let response = try JSONDecoder().decode(CocktailDetailsResponse.self, from: data)
					print("Data : \(response)")
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
