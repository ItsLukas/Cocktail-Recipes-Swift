import Foundation
import UIKit
import Domain

class CocktailCell: UITableViewCell {

	@IBOutlet weak var mainImage: UIImageView!
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var subtitle: UILabel!
	@IBOutlet weak var type: UILabel!

	var cocktail: Cocktail? = nil {
		didSet {
			title.text = cocktail?.strDrink
			type.text = cocktail?.strAlcoholic
			subtitle.text = cocktail?.strCategory

			guard let imgUrl = cocktail?.strDrinkThumb else {
				return
			}

			let url = URL(string: imgUrl)

			DispatchQueue.global().async {
				let data = try? Data(contentsOf: url!)
				DispatchQueue.main.async {
					self.mainImage.image = UIImage(data: data!)
				}
			}
		}
	}
}
