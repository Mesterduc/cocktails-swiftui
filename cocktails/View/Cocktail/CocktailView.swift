//
//  CocktailView.swift
//  cocktails
//
//  Created by Duc hong cai on 23/07/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CocktailView_Previews: PreviewProvider {
    static var recipes = MyRecipes()
    
    static var previews: some View {
        CocktailView(item: Drink.example)
            .environmentObject(recipes)
    }
}

struct CocktailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
   
    let item: Drink.Cocktail
    @StateObject var viewModel = CocktailViewModel()
    
    @State var showBar: Bool = false
    @State var star: Bool = false
    @EnvironmentObject var recipes: MyRecipes
    
    var body: some View {
            ScrollView(.vertical){
                //Hero image
                GeometryReader{  geometry  in
                    if geometry.frame(in: .global).minY <= 0 {
                        WebImage(url: URL(string: "\(item.strDrinkThumb)"))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height)
                    } else {
                        WebImage(url: URL(string: "\(item.strDrinkThumb)"))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: -geometry.frame(in: .global).minY)
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height +
                                    geometry.frame(in: .global).minY)
                    }
                }
                .frame(height:  350)
                
                // Product Name
                Text("\(item.strDrink)")
                    .font(.largeTitle.bold())
                    .padding()
                    
                
                VStack(alignment: .leading){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            //                    Text(item.idDrink)
                            if let tags = item.strTags {
                                let arr  = viewModel.splitCategory(arr: tags)
                                ForEach(arr, id:\.self) { tag in
                                    Text("\(tag)")
                                        .TagModifier()
                                }
                            }
                            
                            Text(item.strCategory)
                                .TagModifier(color: Color.red)
                            
                        }
                    }
                    // Instriction
                    Group{
                        Text("Instruction")
                            .font(.title3.bold())
                            .padding(.top, 5)
                        Text(item.strInstructions)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        
                    }
                    // ingredients
                    Group{
                        Text("Ingredients")
                            .font(.title3.bold())
                            .padding(.top, 5)
                        
                        Text("\(item.strIngredient1): \(item.strMeasure1)")
                        if let ingredient = item.strIngredient2, let measure = item.strMeasure2  {
                            Text("\(ingredient): \(measure)")
                        }
                        if let ingredient = item.strIngredient3, let measure = item.strMeasure3  {
                            Text("\(ingredient): \(measure)")
                        }
                        if let ingredient = item.strIngredient4, let measure = item.strMeasure4  {
                            Text("\(ingredient): \(measure)")
                        }
                        if let ingredient = item.strIngredient5, let measure = item.strMeasure5  {
                            Text("\(ingredient): \(measure)")
                        }
                    }
                    .padding(.bottom, 2)
                    
                }
                .padding(.horizontal, 10)
                Spacer()
                    .modifier(TopBar(showBar: $showBar))
                
                // Custom back button
//                    .BtnBack()
            }
            .edgesIgnoringSafeArea(.top)
            .navigationTitle(self.showBar ? item.strDrink : "")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        if self.star {
                            self.star = false
                        } else {
                            self.star = true
                        }
                    } label: {
                        Image(systemName: self.star ? "star.fill" : "star")
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading:
                    Button(action: {
                        if self.star {
                            if !self.recipes.contains(self.item){
                                self.recipes.add(self.item)
                            }
                        } else {
                            if self.recipes.contains(self.item){
                                self.recipes.remove(self.item)
                            }
                        }
                        self.mode.wrappedValue.dismiss()
                    }, label: {
                        Text("Back")
                    })
            )
            .onAppear(
                perform:{
                    self.star = self.recipes.contains(self.item)
                }
            )
        
    }
    
    
}


