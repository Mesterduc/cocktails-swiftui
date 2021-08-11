//
//  SearchViewModel.swift
//  cocktails
//
//  Created by Duc hong cai on 10/08/2021.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var cocktailList: [Drink.Cocktail] = []
    @Published var cocktailName: String = ""
    
    func fetchCocktailList() {
        fetchCocktails(drink: cocktailName) { drinks in
            DispatchQueue.main.async {
                self.cocktailList = drinks
            }
        }
    }
    
    private func fetchCocktails(drink: String ,completion:@escaping (([Drink.Cocktail]) -> Void)) {
        if let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(drink)") {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    let drink = try? JSONDecoder().decode(Drink.self , from: data )
                    completion(drink?.drinks ?? [])
                }
            }.resume()
        }
    }
}
