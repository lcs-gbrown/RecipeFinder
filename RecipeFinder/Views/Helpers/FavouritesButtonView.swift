//
//  FavouritesButtonView.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-12.
//

import SwiftUI

struct FavouritesButtonView: View {
    
    // MARK: Stored properties
    
    // The song being shown
    let recipe: Recipe
    
    // Is this song in the list of favourites?
    @Binding var inFavourites: Bool
    
    // The list of favourite songs
    @Binding var favourites: [Recipe]
        
    // MARK: Computed properties
    var body: some View {
        
        // Favourites button (heart)
        Button(action: {
            
            addOrRemoveSongFromFavourites()
            
        }) {
            
            HStack {
                Text(inFavourites ? "Remove from\nFavourites" : "Add to\nFavourites")
                    .multilineTextAlignment(.center)

                Image(systemName: inFavourites ? "suit.heart.fill" : "suit.heart")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("deepRed"))
            }
            
        }
        
    }
    
    // MARK: Functions
    func addOrRemoveSongFromFavourites() {
        
        // Is this song in the favourites list?
        if inFavourites == false {
            
            // OK then, add it to the list
            favourites.append(recipe)
            inFavourites = true
            
        } else {
            
            // Find where this song is in the list of songs, then remove it
            // This iterates over the entire "favourites" list, looking
            // for a match to the current song...
            favourites.removeAll(where: { currentSongInList in
                currentSongInList.idMeal == recipe.idMeal
            })
            inFavourites = false
        }

        
    }

}

struct FavouritesButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesButtonView(recipe: testRecipe,
                             inFavourites: .constant(true),
                             favourites: .constant([]))
    }
}
