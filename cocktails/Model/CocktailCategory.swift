//
//  CocktailGroup.swift
//  cocktails
//
//  Created by Duc hong cai on 18/07/2021.
//

import Foundation

struct CocktailCategory: Decodable {
    let drinks: [category]
    
    struct category: Decodable, Hashable {
        var strCategory: String
    }
}
