//
//  ListItemView.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-11.
//

import SwiftUI

struct ListItemView: View {
    
    // MARK: Stored properties
    var meal: Meal
    
    // MARK: Computed properties
    var body: some View {

        VStack(alignment: .leading) {
            
            Text(meal.strMeal)
            
            
        }

    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(meal: testMeal)
    }
}
