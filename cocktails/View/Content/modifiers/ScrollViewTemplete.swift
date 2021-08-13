//
//  ScrollViewTemplete.swift
//  cocktails
//
//  Created by Duc hong cai on 04/08/2021.
//

import Foundation
import SwiftUI

struct ScrollViewTemplete_Previews: PreviewProvider {
    
    static var user = LoginViewModel()
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
            .environmentObject(user)
        
    }
}

struct ScrollViewTemplete: View {
    //    slet
//    @ObservedObject var viewModel: ContentViewModel
    //
    
    var list: [Drink.Cocktail]
    let title: String
    
    init(list: [Drink.Cocktail], title: String){
        self.list = list
        self.title = title
        //            self.content = contentBuilder()
    }
    var body: some View {
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
//            }
            }
        }
        .padding(.horizontal, 15)
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(list, id:\.idDrink){ drink in
                    NavigationLink(destination: CocktailView(item: drink)) {
                        VStack{
                            Image("cocktail")
                                .frame(width: 200, height: 150)
                                .scaledToFit()
                                .cornerRadius(20, corners: [.topLeft , .topRight])
                            
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
