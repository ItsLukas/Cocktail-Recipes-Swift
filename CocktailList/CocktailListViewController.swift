import Foundation
import UIKit
import Domain
import Core

protocol CocktailListViewControllerDelegate {
	func showDetails(cocktail: Cocktail)
}

protocol CocktailListContainer {
	func setData(cocktails: [Cocktail])
}

class CocktailListViewController: UIViewController, CocktailListContainer {

	var tableView = UITableView()
	var listener: CocktailListViewControllerDelegate!
	var presenter: CocktailListPresenter!

	var cocktails: [Cocktail] = [Cocktail]() {
		didSet {
			self.tableView.reloadData()
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.register(CocktailCell.self, forCellReuseIdentifier: "NewCell")

		view.addSubview(tableView)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.translatesAutoresizingMaskIntoConstraints = false
		viewWillLayoutSubviews()
		
		NSLayoutConstraint(
			item: tableView,
			attribute: NSLayoutConstraint.Attribute.leading,
			relatedBy: NSLayoutConstraint.Relation.equal,
			toItem: view,
			attribute: NSLayoutConstraint.Attribute.leading,
			multiplier: 1,
			constant: 0
		).isActive = true
        NSLayoutConstraint(
			item: tableView,
			attribute: NSLayoutConstraint.Attribute.trailing,
			relatedBy: NSLayoutConstraint.Relation.equal,
			toItem: view,
			attribute: NSLayoutConstraint.Attribute.trailing,
			multiplier: 1,
			constant: 0
		).isActive = true
        NSLayoutConstraint(
			item: tableView,
			attribute: NSLayoutConstraint.Attribute.top,
			relatedBy: NSLayoutConstraint.Relation.equal,
			toItem: view,
			attribute: NSLayoutConstraint.Attribute.top,
			multiplier: 1,
			constant: 0
		).isActive = true
        NSLayoutConstraint(
			item: tableView,
			attribute: NSLayoutConstraint.Attribute.bottom,
			relatedBy: NSLayoutConstraint.Relation.equal,
			toItem: view,
			attribute: NSLayoutConstraint.Attribute.bottom,
			multiplier: 1,
			constant: 0
		).isActive = true
	}

	func setData(cocktails: [Cocktail]) {
		self.cocktails = cocktails
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		presenter.viewDidAppear(container: self)
	}
}

extension CocktailListViewController : UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 133
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cocktail = cocktails[indexPath.row]
		listener.showDetails(cocktail: cocktail)
    }
}

extension CocktailListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: CocktailCell = Bundle.main.loadNibNamed("CocktailCell", owner: self, options: nil)?.first as! CocktailCell
		cell.cocktail = cocktails[indexPath.row]
		return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.count
    }
}
