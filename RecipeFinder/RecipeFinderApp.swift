//
//  RecipeFinderApp.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-06.
//

import SwiftUI

@main
struct RecipeFinderApp: App {
    // MARK: Stored properties
    
    // Source of truth for the list of favourite songs
    @State var favourites: [Recipe] = []
    
    var body: some Scene {
        WindowGroup {
            TabView {
                
                SearchView(favourites: $favourites)
                    .tabItem {
                        Text("Search")
                        Image(systemName: "captions.bubble.fill")
                    }
                
                FavouritesView(favourites: $favourites)
                    .tabItem {
                        Image(systemName: "suit.heart.fill")
                        Text("Favourites")
                    }
               
            }
        }
    }
}
