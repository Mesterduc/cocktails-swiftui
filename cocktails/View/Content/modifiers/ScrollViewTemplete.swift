//
//  ScrollViewTemplete.swift
//  cocktails
//
//  Created by Duc hong cai on 04/08/2021.
//

import SwiftUI
// used for handling image of api
import SDWebImageSwiftUI

struct ScrollViewTemplete_Previews: PreviewProvider {
    
    static var user = LoginViewModel()
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
            .environmentObject(user)
        
    }
}

struct ScrollViewTemplete: View {
    
    var list: [Drink.Cocktail]
    let title: String
    
    init(list: [Drink.Cocktail], title: String){
        self.list = list
        self.title = title
    }
    var body: some View {
        // category tittle and see all button
        HStack{
            Text(title)
                .font(.title2.bold())
                .padding(0)
            Spacer()
            NavigationLink(destination: CocktailListView(item: list)){
                Text("See all")
                    .padding(5)
                    .font(.system(size: 18))
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal, 15)
        
        // the scrollview
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                // foreach on the passed list
                ForEach(list, id:\.idDrink){ drink in
                    // all items is a link to its own cocktail page
                    NavigationLink(destination: CocktailView(item: drink)) {
                        // the cocktail card
                        VStack{
                            // card image
                            WebImage(url: URL(string: "\(drink.strDrinkThumb)"))
                                .resizable()
                                .frame(width: 200, height: 150)
                                .cornerRadius(20, corners: [.topLeft , .topRight])
                            // card text
                            VStack{
                                Text(drink.strDrink)
                                    .font(.title3.bold())
                                    .lineLimit(1)
                                Text(drink.strAlcoholic)
                            }
                            .padding(.horizontal, 5)
                            .foregroundColor(.black)
                            .padding(.bottom, 10)
                        }
                                                        
                        
                    }
                    .frame(width: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black.opacity(0.2), lineWidth: 1)
                    )
                }
            }
            .padding(.horizontal, 15)
        }
    }
}
