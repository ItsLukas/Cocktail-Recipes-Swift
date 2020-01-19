import Domain

struct CocktailDetailsResponse: Codable {
	let drinks: [Cocktail]
}
