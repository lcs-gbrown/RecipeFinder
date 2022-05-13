//
//  ListItemViewTwo.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-12.
//

import SwiftUI

struct ListItemViewTwo: View {
    // MARK: Stored properties
    var recipe: Recipe
    
    // MARK: Computed properties
    var body: some View {

        VStack(alignment: .leading) {
            
            Text(recipe.strMeal)
            
            
        }

    }
}

struct ListItemViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        ListItemViewTwo(recipe: testRecipe)
    }
}
