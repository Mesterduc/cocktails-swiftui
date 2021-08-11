//
//  ContentView.swift
//  cocktails
//
//  Created by Duc hong cai on 18/07/2021.
//

import SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
        
    }
}

struct ContentView: View {
    @ObservedObject var viewModel:  ContentViewModel
    
    var body: some View {
        ScrollView( showsIndicators: false){
            LazyVStack{
                // Hero section
                HStack{
                    Image("cocktail")
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.size.width - 30, height: 240)
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 5, x: 0, y: 0)
                        .overlay(
                            Text("Cocktails")
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                                .padding()
                            , alignment: .bottomLeading
                        )
                }
                
                VStack{
                // Margarita ScrollView
                ScrollViewTemplete(list: viewModel.margaritaList, title: viewModel.margarita)
                    .padding(.horizontal, 15)
                
                // Categories section
                cocktailCategoryScrollView(viewModel: viewModel)
                    .padding(.horizontal, 15)
                
                // Daiquiri ScrollView
                ScrollViewTemplete(list: viewModel.daiquiriList, title: viewModel.daiquiri)
                    .padding(.horizontal, 15)
                
                Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

// Maybe make ObservedObject to environment object

struct cocktailCategoryScrollView: View {
    @ObservedObject var viewModel:  ContentViewModel
    var body: some View{
        Text("Categories")
            .TitleModifier()
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 15){
                ForEach(viewModel.category.prefix(6), id:\.self){ category in
                    LazyVStack(spacing: 15){
                        Image("cocktail")
                            .frame(width:175, height: 150)
                            .cornerRadius(10)
                            .scaledToFit()
                        Text(category.strCategory)
                        Spacer()
                    }
                    .frame(height: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black.opacity(0.2), lineWidth: 1)
                    )
                }
            }
        }
    }
}


// test
//                HStack{
//                    Text(title)
//                    Spacer()
//                    NavigationLink(destination: CocktailListView(item: list)){
//                        Text("See all")
//                            .padding(6)
//                            .font(.system(size: 18))
//                            .background(Color.blue.opacity(0.2))
//                            .cornerRadius(10)
//                    }
//                }
//                .TitleModifier()
//                ScrollView(.horizontal, showsIndicators: false){
//                    HStack{
//                        ForEach(viewModel.margaritaList, id:\.self){ drink in
//                            NavigationLink(destination: CocktailView(item: drink)) {
//                                VStack{
//                                    Image("cocktail")
//                                        .frame(width: 200, height: 150)
//                                        .scaledToFit()
//                                        .cornerRadius(20, corners: [.topLeft , .topRight])
//
//                                    VStack{
//                                        Text(drink.strDrink)
//                                            .font(.title3.bold())
//                                        Text(drink.strAlcoholic)
//                                    }
//                                    .padding(.horizontal, 5)
//                                    .foregroundColor(.black)
//                                    .padding(.bottom, 10)
//                                }
//
//
//                            }
//                            .frame(width: 200)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 16)
//                                    .stroke(Color.black.opacity(0.2), lineWidth: 1)
//                            )
//                        }
//                    }
//                }
