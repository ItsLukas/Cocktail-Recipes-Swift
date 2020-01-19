import Foundation
import UIKit
import Domain

protocol CocktailDetailsContainer {
	func setData(cocktail: Cocktail)
}

public class CocktailDetailsViewController: UIViewController, CocktailDetailsContainer {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var cocktailInstructions: UILabel!
	@IBOutlet weak var cocktailName: UILabel!
	@IBOutlet weak var cocktailAlcho: UILabel!
	@IBOutlet weak var cocktailType: UILabel!
	@IBOutlet weak var cocktailGlass: UILabel!

	@IBOutlet weak var ing1: UILabel!
	@IBOutlet weak var mes1: UILabel!
	@IBOutlet weak var ing2: UILabel!
	@IBOutlet weak var mes2: UILabel!
	@IBOutlet weak var ing3: UILabel!
	@IBOutlet weak var mes3: UILabel!
	@IBOutlet weak var ing4: UILabel!
	@IBOutlet weak var mes4: UILabel!
	@IBOutlet weak var ing5: UILabel!
	@IBOutlet weak var mes5: UILabel!
	@IBOutlet weak var ing6: UILabel!
	@IBOutlet weak var mes6: UILabel!
	@IBOutlet weak var ing7: UILabel!
	@IBOutlet weak var mes7: UILabel!
	@IBOutlet weak var ing8: UILabel!
	@IBOutlet weak var mes8: UILabel!
	@IBOutlet weak var ing9: UILabel!
	@IBOutlet weak var mes9: UILabel!
	@IBOutlet weak var ing10: UILabel!
	@IBOutlet weak var mes10: UILabel!
	@IBOutlet weak var ing11: UILabel!
	@IBOutlet weak var mes11: UILabel!
	@IBOutlet weak var ing12: UILabel!
	@IBOutlet weak var mes12: UILabel!
	@IBOutlet weak var ing13: UILabel!
	@IBOutlet weak var mes13: UILabel!
	@IBOutlet weak var ing14: UILabel!
	@IBOutlet weak var mes14: UILabel!
	@IBOutlet weak var ing15: UILabel!
	@IBOutlet weak var mes15: UILabel!

	public var presenter: CocktailDetailsPresenter!

	public override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		presenter.viewDidAppear(container: self)
	}

	func setData(cocktail: Cocktail) {
		cocktailName.text = cocktail.strDrink
		cocktailAlcho.text = cocktail.strAlcoholic
		cocktailType.text = cocktail.strCategory
		cocktailGlass.text = cocktail.strGlass
		cocktailInstructions.text = cocktail.strInstructions
		guard let imgUrl = cocktail.strDrinkThumb else {
			return
		}

		let url = URL(string: imgUrl)

		DispatchQueue.global().async {
			let data = try? Data(contentsOf: url!)
			DispatchQueue.main.async {
				self.imageView.image = UIImage(data: data!)
			}
		}

		ing1.text = cocktail.strIngredient1 ?? ""
		mes1.text = cocktail.strMeasure1 ?? ""
		ing2.text = cocktail.strIngredient2 ?? ""
		mes2.text = cocktail.strMeasure2 ?? ""
		ing3.text = cocktail.strIngredient3 ?? ""
		mes3.text = cocktail.strMeasure3 ?? ""
		ing4.text = cocktail.strIngredient4 ?? ""
		mes4.text = cocktail.strMeasure4 ?? ""
		ing5.text = cocktail.strIngredient5 ?? ""
		mes5.text = cocktail.strMeasure5 ?? ""
		ing6.text = cocktail.strIngredient6 ?? ""
		mes6.text = cocktail.strMeasure6 ?? ""
		ing7.text = cocktail.strIngredient7 ?? ""
		mes7.text = cocktail.strMeasure7 ?? ""
		ing8.text = cocktail.strIngredient8 ?? ""
		mes8.text = cocktail.strMeasure8 ?? ""
		ing9.text = cocktail.strIngredient9 ?? ""
		mes9.text = cocktail.strMeasure9 ?? ""
		ing10.text = cocktail.strIngredient10 ?? ""
		mes10.text = cocktail.strMeasure10 ?? ""
		ing11.text = cocktail.strIngredient11 ?? ""
		mes11.text = cocktail.strMeasure11 ?? ""
		ing12.text = cocktail.strIngredient12 ?? ""
		mes12.text = cocktail.strMeasure12 ?? ""
		ing13.text = cocktail.strIngredient13 ?? ""
		mes13.text = cocktail.strMeasure13 ?? ""
		ing14.text = cocktail.strIngredient14 ?? ""
		mes14.text = cocktail.strMeasure14 ?? ""
		ing15.text = cocktail.strIngredient15 ?? ""
		mes15.text = cocktail.strMeasure15 ?? ""
	}
}
