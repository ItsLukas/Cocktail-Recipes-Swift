import Foundation
import Domain

struct CocktailsResponse: Codable {
	let drinks: [Cocktail]
}
