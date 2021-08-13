//
//  CategoryTemplateView.swift
//  cocktails
//
//  Created by Duc hong cai on 13/08/2021.
//

import SwiftUI

struct CategoryTemplateView: View {
    @ObservedObject var viewModel:  ContentViewModel
    var body: some View{
        Text("Categories")
            .TitleModifier()
            .padding(.horizontal, 15)
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 15){
                ForEach(viewModel.category.prefix(6), id:\.self){ category in
                    LazyVStack(alignment: .leading ,spacing: 15){
                        Image("cocktail")
                            .frame(width:175, height: 150)
                            .scaledToFit()
                            .cornerRadius(20, corners: [.topLeft , .topRight])
                        Text(category.strCategory)
                            .padding([.bottom, .leading], 10)
                    }
                    
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

struct CategoryTemplateView_Previews: PreviewProvider {
    static var user = LoginViewModel()
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
            .environmentObject(user)
        
    }
}

