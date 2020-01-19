import Foundation
import UIKit
import Core
import Domain
import Cocktail_Details

public class CocktailListCoordinator: Coordinator {

	private let networking: Core.Networking
	var navigationController: UINavigationController!

	public init (_ networking: Core.Networking, _ navigationController: UINavigationController) {
		self.networking = networking
		self.navigationController = navigationController
	}

	public func start() {
		let vc = CocktailListViewController()
		vc.presenter = CocktailListPresenter(
			CocktailListService(networking: networking)
		)
		vc.listener = CocktailListViewControllerListener(self)
		navigationController.pushViewController(vc, animated: false)
	}

	private func showCocktailDetails(cocktail: Cocktail) {
		let vc = CocktailDetailsViewController(nibName: "CocktailDetailsViewController", bundle: nil)
		vc.presenter = CocktailDetailsPresenter(
			CocktailDetailsService(networking: networking),
			cocktail.idDrink
		)
		navigationController.pushViewController(vc, animated: true)
	}

	private class CocktailListViewControllerListener: CocktailListViewControllerDelegate {
		private unowned var parent: CocktailListCoordinator

		init(_ parent: CocktailListCoordinator) {
			self.parent = parent
		}

		func showDetails(cocktail: Cocktail) {
			parent.showCocktailDetails(cocktail: cocktail)
		}
	}
}
