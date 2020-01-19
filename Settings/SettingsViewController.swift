import Foundation
import UIKit
import Core
import Domain

class SettingsViewController: UIViewController {
	
	@IBOutlet weak var chooseFilterView: UIView!

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.onClick))
		self.chooseFilterView.addGestureRecognizer(gesture)
	}

	@objc func onClick(sender : UITapGestureRecognizer) {
		showAlert()
	}

	private func showAlert() {
		let alert = UIAlertController(title: "Choose one filter letter ", message: nil, preferredStyle: .alert)

		let filter = UserDefaults.standard.string(forKey: "filterKey") ?? "A"
		alert.addTextField { (textField) in
			textField.text = filter
		}

		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
			let textField = alert?.textFields![0]
			let value = textField?.text
			UserDefaults.standard.set(value, forKey: "filterKey")
		}))

		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { [weak alert] (_) in
			alert?.dismiss(animated: true, completion: nil)
		}))
		self.present(alert, animated: true, completion: nil)
	}
}
