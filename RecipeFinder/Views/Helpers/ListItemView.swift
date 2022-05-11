//
//  ListItemView.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-11.
//

import SwiftUI

struct ListItemView: View {
    
    // MARK: Stored properties
    var recipe: Recipe
    
    // MARK: Computed properties
    var body: some View {

        VStack(alignment: .leading) {
            
            Text(recipe.strMeal)
            
            
        }

    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(recipe: testRecipe)
    }
}
