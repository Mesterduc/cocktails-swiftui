//
//  Cocktail.swift
//  cocktails
//
//  Created by Duc hong cai on 18/07/2021.
//

import Foundation
struct Drink: Decodable {
    var drinks: [Cocktail]
    
    struct Cocktail: Decodable, Hashable {
        let idDrink: String
        let strDrink: String
        let strTags: String?
        let strCategory: String
        let strAlcoholic: String
        let strInstructions: String
        let strDrinkThumb: String
        let strIngredient1: String
        let strIngredient2: String?
        let strIngredient3: String?
        let strIngredient4: String?
        let strIngredient5: String?
        let strMeasure1: String
        let strMeasure2: String?
        let strMeasure3: String?
        let strMeasure4: String?
        let strMeasure5: String?
//        var star: Bool?
    }
    
    static let example =  Drink.Cocktail(idDrink: "11007", strDrink: "Margarita", strTags: "IBA,ContemporaryClassic", strCategory: "Ordinary Drink", strAlcoholic: "Alcoholic", strInstructions: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg", strIngredient1: "Tequila", strIngredient2: "Triple sec", strIngredient3: "Lime juice", strIngredient4: "Salt", strIngredient5: nil, strMeasure1: "1 1/2 oz ", strMeasure2: "1/2 oz ", strMeasure3: "1 oz ", strMeasure4: nil, strMeasure5: nil)
    
}

