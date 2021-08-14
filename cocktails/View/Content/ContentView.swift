//
//  ContentView.swift
//  cocktails
//
//  Created by Duc hong cai on 18/07/2021.
//

import SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var user = LoginViewModel()
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
            .environmentObject(user)
        
    }
}

struct ContentView: View {
    @ObservedObject var viewModel:  ContentViewModel
    @EnvironmentObject var user: LoginViewModel
    
    var body: some View {
        ScrollView( showsIndicators: false){
            ZStack{
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
                        
                        // Categories section
                        CategoryTemplateView(viewModel: viewModel)
                        
                        // Daiquiri ScrollView
                        ScrollViewTemplete(list: viewModel.daiquiriList, title: viewModel.daiquiri)
                        
                        Spacer()
                    }
                }
            }
        }
        
        
        // Login overlay
        .overlay(
            GeometryReader{ geo in
                ZStack{
                    LoginView()
                }
                .position(CGPoint(x: geo.frame(in: .global).midX, y: user.loggedIn ? geo.frame(in: .global).midY : -geo.frame(in: .global).midY - 50 ))
                .edgesIgnoringSafeArea(.all)
                
                
            }
            .animation(.easeInOut(duration: 1))
        )

        .navigationBarHidden(true)
        
    }
}
