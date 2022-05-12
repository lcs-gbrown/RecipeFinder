//
//  Meal.swift
//  RecipeFinder
//
//  Created by gabi brown on 2022-05-12.
//

import Foundation

struct Meal: Decodable {
    
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
}

let testMeal = Meal(strMeal: "Chick-Fil-A Sandwic",
                    strMealThumb: "https://www.themealdb.com/images/media/meals/sbx7n71587673021.jpg",
                    idMeal: "53016")
