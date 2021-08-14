//
//  SearchView.swift
//  cocktails
//
//  Created by Duc hong cai on 20/07/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    
    @State private var clearButton = false
    @State private var hidden = false
    @State private var cocktailName: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            //search field
            VStack(alignment: .leading){
                Text("Inserted cocktail name: \(self.cocktailName)")
                HStack{
                    Image(systemName: "magnifyingglass")
                        .padding()
                        .foregroundColor(.black.opacity(0.4))
                    TextField("Cocktail name....", text: self.$cocktailName)
                        .onChange(of: self.cocktailName, perform: { value in
                            if !self.cocktailName.isEmpty {
                                self.clearButton = true
                            }
                            viewModel.fetchCocktailList(drink: self.cocktailName)
                        })
                    Button(action:
                            {
                                self.cocktailName = ""
                                self.clearButton = false
                            })
                    {
                        Text("Clear")
                    }
                    .padding(.trailing, 8)
                    .opacity(clearButton ? 1 : 0)
                    .animation(.easeInOut)
                    
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black.opacity(0.4), lineWidth: 2)
                )
                
            }
            
            // results
            VStack(alignment:.center){
            Text("Cocktails")
                .font(.title.bold())
            }
                
//                ForEach(viewModel.cocktailList, id:\.idDrink) { cocktail in
//                    Text(cocktail.strDrink)
//                }
            ScrollView(.vertical){
                VStack(alignment: .leading){
                ForEach(viewModel.cocktailList, id:\.self){ drink in
                    NavigationLink(
                        destination: CocktailView(item: drink),
                        label: {
                            HStack(spacing: 15){
                                WebImage(url: URL(string: "\(drink.strDrinkThumb)"))
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
                            .padding(.horizontal, 10)
                            .foregroundColor(.black)
                            .opacity(0.8)
                            
                        })
                    
                }
                .opacity(hidden ? 1 : 0)
                .animation(.linear)
                }
            }
            
            
            .onChange(of: cocktailName, perform: { value in
                withAnimation(.easeInOut(duration: 2)){
                    self.hidden = true
                }
            })
            .onAppear(perform: {
                withAnimation(.easeInOut(duration: 2)){
                    self.hidden = true
                }
            })
            Spacer()
        }
        .padding(.horizontal, 10)
        .navigationTitle("Find Cocktail")
    }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
