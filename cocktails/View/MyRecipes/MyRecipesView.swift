//
//  MyRecipesView.swift
//  cocktails
//
//  Created by Duc hong cai on 20/07/2021.
//

import SwiftUI

struct MyRecipesView_Previews: PreviewProvider {
    static var recipes = MyRecipes()
    
    static var previews: some View {
        MyRecipesView()
            .environmentObject(recipes)
    }
}

struct MyRecipesView: View {
    @EnvironmentObject var recipes: MyRecipes
    
    var body: some View {
        VStack{
            if recipes.isEmpty() {
                Text("No Cocktails is saved")
            } else {
                
                LazyVStack(alignment: .leading, spacing: 15) {
                    ForEach(recipes.getRecipes(), id:\.self){ drink in
                        //                        Text(drink.strCategory)
                        NavigationLink(
                            destination: CocktailView(item: drink),
                            label: {
                                HStack(spacing: 15){
                                    Image("photo2")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                    VStack(alignment: .leading, spacing: 5){
                                        Text(drink.strDrink)
                                            .font(.headline)
                                        Text(drink.strCategory)
                                            .font(.subheadline)
                                    }
                                }
                                .padding()
                                .foregroundColor(.black)
                                .opacity(0.8)
                                
                            })
                        
                    }
                    .onDelete(perform: { indexSet in
                        for index in indexSet {
                            recipes.removeIndex(index)
                        }
                    })
                    
                }
                .frame(width: UIScreen.main.bounds.size.width)
                Spacer()
                
            }
        }
        .navigationTitle("My Recipies")
    }
}


