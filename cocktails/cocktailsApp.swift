//
//  cocktailsApp.swift
//  cocktails
//
//  Created by Duc hong cai on 18/07/2021.
//

import SwiftUI
@main

struct cocktailsApp: App {
    @StateObject var viewModel = ContentViewModel()
    @ObservedObject var recipes = MyRecipes()
    @ObservedObject var user = LoginViewModel()
    var body: some Scene {
        WindowGroup {
            //            ZStack{
            TabView{
                NavigationView{
                    
                    ContentView(viewModel: viewModel)
                }
                .tabItem {
                    Label("Explore", systemImage: "list.dash")
                }
                NavigationView{
                    MyRecipesView()
                }
                .tabItem {
                    Label("Recipes", systemImage: "heart.text.square")
                }
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                
                Profile2View()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle.fill")
                    }
            }
            .overlay(
                GeometryReader{ geo in
                    ZStack{
                        LoginView()
                    }
                    .position(CGPoint(x: geo.frame(in: .global).midX, y: user.loggedIn ? geo.frame(in: .global).midY : -geo.frame(in: .global).midY - 50 ))
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(2)
                    
                }
                .animation(.easeInOut(duration: 1))
            )
            //                }
            //            }
            .environmentObject(recipes)
            .environmentObject(user)
        }
    }
}
