//
//  ScrollViewTemplete.swift
//  cocktails
//
//  Created by Duc hong cai on 04/08/2021.
//

import Foundation
import SwiftUI

//struct ScrollViewTemplete_Previews: PreviewProvider {
////    @ObservedObject var viewModel:  ContentViewModel
//    var list2: [Drink.Cocktail]
//    
//    static var previews: some View {
//        ScrollViewTemplete(list: [Drink.example],
//                           title: "Margarita")
////            .onAppear(perform: ContentViewModel().fetchMargarita)
//    }
//}

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
            Spacer()
            NavigationLink(destination: CocktailListView(item: list)){
//            Button {
//                print("Image tapped!")
//            } label: {
                Text("See all")
                    .padding(6)
                    .font(.system(size: 18))
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
//            }
            }
        }
        .TitleModifier()
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
                                Text(drink.strAlcoholic)
                            }
                            .padding(.horizontal, 5)
                            .foregroundColor(.black)
                            .padding(.bottom, 10)
                        }
                                                        
                        
                    }
                    .frame(width: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black.opacity(0.2), lineWidth: 1)
                    )
                }
            }
        }
    }
}
