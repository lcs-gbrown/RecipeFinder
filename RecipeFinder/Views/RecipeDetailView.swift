//
//  RecipeDetailView.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-06.
//

import SwiftUI

struct RecipeDetailView: View {
    // MARK: Stored properties
    
    var recipe: Recipe
    
    // MARK: Computed properties
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading)  {
                
                Text(recipe.strMeal)
                    .font(.largeTitle)
                
                VideoView(strYouTube: "https://www.youtube.com/watch?v=1WDesu7bUDM")
                
                RemoteImageView(fromURL: URL(string: recipe.strMealThumb)!)
                
                Text(recipe.strInstructions)
                    .font(.body)
                
                Link("View recipe", destination: URL(string: recipe.strSource)!)
                    .padding(.top, 5)
               
                Link("View video", destination: URL(string: recipe.strYouTube)!)
                    .padding(.top, 5)
            }
            
            
        }
      
    }
}


struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: testRecipe)
    }
}
