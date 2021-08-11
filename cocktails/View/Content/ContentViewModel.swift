//
//  ContentViewModel.swift
//  cocktails
//
//  Created by Duc hong cai on 18/07/2021.
//

import Foundation

class ContentViewModel: ObservableObject{
    @Published var margaritaList: [Drink.Cocktail] = []
    @Published var margarita: String = "Margarita"
    
    @Published var daiquiriList: [Drink.Cocktail] = []
    @Published var daiquiri: String = "Daiquiri"
    
    @Published var category: [CocktailCategory.category] = []
    
    init() {
        fetchMargarita()
        fetchDaiquiri()
        fetchCategory()
        self.margaritaList = [Drink.example]
    }
    
    func fetchCategory() {
        fetchCategories() { category in
            DispatchQueue.main.async {
                self.category = category
            }
        }
    }
    
    func fetchMargarita() {
        fetchCocktails(drink: margarita) { drinks in
            DispatchQueue.main.async {
                self.margaritaList = drinks
            }
        }
    }
    
    func fetchDaiquiri() {
        fetchCocktails(drink: daiquiri) { drinks in
            DispatchQueue.main.async {
                self.daiquiriList = drinks
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
    
    private func fetchCategories(completion:@escaping (([CocktailCategory.category]) -> Void)) {
        if let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list") {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    let category = try? JSONDecoder().decode(CocktailCategory.self , from: data )
//                    print(category!)
                    completion(category?.drinks ?? [])
                }
            }.resume()
        }
    }
    
    
}
