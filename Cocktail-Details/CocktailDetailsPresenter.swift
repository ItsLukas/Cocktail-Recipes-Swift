import Foundation

public class CocktailDetailsPresenter {

	var cocktailId: String!
	var networkService: CocktailDetailsService!

	public init(_ networkService: CocktailDetailsService, _ cocktailId: String) {
		self.networkService = networkService
		self.cocktailId = cocktailId
	}

	func viewDidAppear(container: CocktailDetailsContainer) {
		self.networkService.fetchDetails(cocktailId: cocktailId, completionHandler: { result in
			switch result {
				case .success(let cocktails):
					DispatchQueue.main.async {
						container.setData(cocktail: cocktails.first!)
					}
				case .failure(let error):
					print("Error: \(error)")
			}
		})
	}
}
