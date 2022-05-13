//
//  FavouritesView.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-12.
//

import SwiftUI

struct FavouritesView: View {
    
    // MARK: Stored properties
    
    // Derived value; a reference to the list of favourite songs
    @Binding var favourites: [Recipe]
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            
            VStack {
                // Show message if no favourites noted
                if favourites.isEmpty {

                    Spacer()
                    
                    Text("No favourite recipes yet")
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                    Spacer()

                } else {

                    List(favourites, id: \.idMeal) { currentRecipe in
                        
                        NavigationLink(destination: RecipeDetailView(recipeId: currentRecipe.idMeal, inFavourites: true, favourites: $favourites)) {
                            ListItemViewTwo(recipe: currentRecipe)
                        }
                        
                    }
                    
                }
            }
            .navigationTitle("Favourites")
            
        }
        
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(favourites: .constant([testRecipe]))
    }
}
