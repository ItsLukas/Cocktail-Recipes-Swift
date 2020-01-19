import Foundation

class CocktailListPresenter {

	var networkService: CocktailListService!

	init(_ networkService: CocktailListService) {
		self.networkService = networkService
	}

	func viewDidAppear(container: CocktailListContainer) {
		let filter = UserDefaults.standard.string(forKey: "filterKey") ?? "A"
		self.networkService.fetchList(filter: filter, completionHandler: { result in
			switch result {
				case .success(let cocktails):
					DispatchQueue.main.async {
						container.setData(cocktails: cocktails)
					}
				case .failure(let error):
					print("Error: \(error)")
			}
		})
	}
}
