//
//  Recipe.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-06.
//

import Foundation

struct Recipe: Identifiable {
    
    let id = UUID()
    let idMeal: Int
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    let strYouTube: String
    let strSource: String
    
}

let testRecipe = Recipe(idMeal: 53016,
                        strMeal: "Chick-Fil-A Sandwich",
                        strInstructions: "Wrap the chicken loosely between plastic wrap and pound gently with the flat side of a meat tenderizer until about 1/2 inch thick all around.Cut into two pieces, as even as possible. Marinate in the pickle juice for 30 minutes to one hour (add a teaspoon of Tabasco sauce now for a spicy sandwich).Beat the egg with the milk in a bowl.Combine the flour, sugar, and spices in another bowl.Dip the chicken pieces each into the egg on both sides, then coat in flour on both sides.Heat the oil in a skillet (1/2 inch deep) to about 345-350.Fry each cutlet for 2 minutes on each side, or until golden and cooked through.Blot on paper and serve on toasted buns with pickle slices.",
                        strMealThumb: "https://www.themealdb.com/images/media/meals/sbx7n71587673021.jpg",
                        strYouTube: "https://www.youtube.com/watch?v=1WDesu7bUDM",
                        strSource: "https://hilahcooking.com/chick-fil-a-copycat/")
