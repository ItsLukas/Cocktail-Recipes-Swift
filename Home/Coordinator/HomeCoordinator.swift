import UIKit
import Core
import CocktailList
import Settings

public class HomeCoordinator: Coordinator {

	private let networking: Core.Networking
	var childCoordinators = [Coordinator]()
	private weak var navigationController: UINavigationController?

	public init(_ networking: Core.Networking, _ navigationController: UINavigationController?) {
		self.networking = networking
		self.navigationController = navigationController
	}

	public func start() {
		let tabController = HomeTabBarController()

		let cocktailNavigationController = UINavigationController()
		cocktailNavigationController.tabBarItem = UITabBarItem(
			title: "Cocktails",
			image: UIImage.init(named: "ic_cocktail"),
			selectedImage: UIImage.init(named: "ic_cocktail")
        )

		let settingsNavigationController = UINavigationController()
		settingsNavigationController.tabBarItem = UITabBarItem(
			title: "Settings",
			image: UIImage.init(named: "ic_settings"),
			selectedImage: UIImage.init(named: "ic_settings")
		)

		tabController.viewControllers = [
			cocktailNavigationController,
			settingsNavigationController
		]

		let cocktailListCoordinator = CocktailListCoordinator(networking, cocktailNavigationController)
		let settingsCoordinator = SettingsCoordinator(settingsNavigationController)

		childCoordinators.append(cocktailListCoordinator)
		childCoordinators.append(settingsCoordinator)

		cocktailListCoordinator.start()
		settingsCoordinator.start()

		navigationController?.viewControllers = [tabController]
	}
}
