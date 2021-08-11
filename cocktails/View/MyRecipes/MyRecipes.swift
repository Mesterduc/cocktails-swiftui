//
//  MyRecipes.swift
//  cocktails
//
//  Created by Duc hong cai on 02/08/2021.
//

import SwiftUI

class MyRecipes: ObservableObject {
    // the actual resorts the user has favorited
    private var recipes: [Drink.Cocktail]
//    private var recipes: Set<String>

    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"

    init() {
        // load our saved data

        // still here? Use an empty array
        self.recipes = [Drink.example]
    }

    // returns true if our set contains this resort
    func contains(_ recipes: Drink.Cocktail) -> Bool {
        return self.recipes.contains(recipes)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ recipes: Drink.Cocktail) {
        objectWillChange.send()
        self.recipes.append(recipes)
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ recipes: Drink.Cocktail) {
        objectWillChange.send()
        if let index = self.recipes.firstIndex(of: recipes){
            self.recipes.remove(at: index)
            
        }
        save()
    }
    
    func removeIndex(_ index: Int) {
        objectWillChange.send()
        self.recipes.remove(at: index)
    }
    
    func isEmpty() -> Bool  {
//        objectWillChange.send()
        if self.recipes.count != 0 {
            return false
        }
        return true
    }

    func getRecipes() -> Array<Drink.Cocktail> {
        return self.recipes
    }
    func save() {
//        print(self.recipes)
    }
}
