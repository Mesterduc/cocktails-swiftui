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
            .environmentObject(recipes)
            .environmentObject(user)
        }
    }
}
