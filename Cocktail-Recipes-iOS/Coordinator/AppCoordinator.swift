import UIKit
import Core
import Home

class AppCoordinator: Coordinator {
    private let window: UIWindow
	private let networking: Networking
	
	private lazy var navigationController = { () -> UINavigationController in 
		let controller = UINavigationController()
		controller.setNavigationBarHidden(true, animated: false)
		return controller
	}()

	private lazy var homeCoordinator: Coordinator = {
		return HomeCoordinator(networking, navigationController)
	}()

    init(window: UIWindow) {
        self.window = window
		self.networking = ApiNetworking()
    }

    func start() {
        window.rootViewController = navigationController
		homeCoordinator.start()
		window.makeKeyAndVisible()
    }
}
