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
                
                // Navigation is restricted
                WebView(address: recipe.strYouTube.replacingOccurrences(of: "watch", with: "watch_popup"),
                        restrictToAddressBeginningWith: "")
                .border(.black, width: 1.0)
                // A height must be specified if additional content is placed below the web view.
                .frame(height: 250)
                
        
                
                Link("View recipe", destination: URL(string: recipe.strSource)!)
                                    .padding(.top, 5)
                
                Text(recipe.strInstructions)
                    .font(.body)
                
                
               
                Link("View video", destination: URL(string: recipe.strYouTube)!)
                    .padding(.top, 5)
            }
            
            .padding()
        }
      
    }
}


struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: testRecipe)
    }
}
