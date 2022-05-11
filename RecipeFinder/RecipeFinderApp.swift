//
//  RecipeFinderApp.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-06.
//

import SwiftUI

@main
struct RecipeFinderApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                
                SearchView()
                    .tabItem {
                        Text("Search")
                        Image(systemName: "captions.bubble.fill")
                    }
                
                RecipeDetailView(recipe: testRecipe)
                    .tabItem {
                        Text("Recipe Details")
                        Image(systemName: "captions.bubble.fill")
                    }
                
               
            }
        }
    }
}
