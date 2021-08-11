//
//  CocktailListView.swift
//  cocktails
//
//  Created by Duc hong cai on 09/08/2021.
//

import SwiftUI

//struct CocktailListView_Previews: PreviewProvider {
//    @StateObject var viewModel = CocktailViewModel()
//    static var previews: some View {
//        CocktailListView(item: viewModel)
//    }
//}

struct CocktailListView: View {
    let item: [Drink.Cocktail]
//    @StateObject var viewModel = CocktailViewModel()
    
    var body: some View {
        VStack{
            ForEach(item, id:\.self){ list in
                
            
                Text("\(list.strDrink)")
        }
        }
    }
}

