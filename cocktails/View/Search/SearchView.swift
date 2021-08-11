//
//  SearchView.swift
//  cocktails
//
//  Created by Duc hong cai on 20/07/2021.
//

import SwiftUI
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchView: View {
    @State private var hidden = false
    
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Inserted cocktail name: \(viewModel.cocktailName)")
                //search field
                HStack{
                    Image(systemName: "magnifyingglass")
                        .padding()
                        .foregroundColor(.black.opacity(0.4))
                    TextField("Cocktail name....", text: $viewModel.cocktailName)
                        .onChange(of: viewModel.cocktailName, perform: { value in
                            if !viewModel.cocktailName.isEmpty {
                                self.hidden = false
                            }
                            viewModel.fetchCocktailList()
                        })
                    Button(action:
                            {
                                viewModel.cocktailName = ""
                                self.hidden = false
                            })
                    {
                        Text("Clear")
                    }
                    .padding(.trailing, 8)
                    .opacity(hidden ? 1 : 0)
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
                ForEach(viewModel.cocktailList, id:\.idDrink) { cocktail in
                    Text(cocktail.strDrink)
                    //                    .animation(.easeInOut(duration: 2))
                }
                .opacity(hidden ? 1 : 0)
//                .scaleEffect(hidden ? 1.5 : 0)
            }
            
            .onChange(of: viewModel.cocktailList, perform: { value in
                withAnimation(.spring(response: 2, dampingFraction: 1, blendDuration: 0.5)){
                                    self.hidden = true
                                }
//                withAnimation(.linear(duration: 2)){
//                    self.hidden = true
//                }
            })
            .onAppear(perform: {
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.2, blendDuration: 0)){
                                    self.hidden = true
                                }
//                withAnimation(.linear(duration: 2)){
//                    self.hidden = true
//                }
            })
            Spacer()
        }
        .padding(.horizontal, 10)
        .navigationTitle("Find Cocktail")
        //        .onAppear(perform: {
        //            viewModel.fetchCocktailList()
        //        })
    }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
