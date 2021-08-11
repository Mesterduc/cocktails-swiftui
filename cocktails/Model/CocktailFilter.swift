//
//  CocktailFilter.swift
//  cocktails
//
//  Created by Duc hong cai on 18/07/2021.
//

import Foundation

struct CocktailFilter {
    let idDrink: String
    let strDrinkThumb: String
    let strDrink: String
}

extension CocktailFilter: Identifiable {
    var id: String { return idDrink }
}
