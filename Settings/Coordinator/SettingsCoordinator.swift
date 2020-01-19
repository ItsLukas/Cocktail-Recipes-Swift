import Foundation
import UIKit
import Core
import Domain

public class SettingsCoordinator: Coordinator {

	var navigationController: UINavigationController!

	public init (_ navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	public func start() {
		let vc = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
		navigationController.pushViewController(vc, animated: false)
	}
}
