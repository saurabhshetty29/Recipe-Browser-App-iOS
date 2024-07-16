//
//  Meal.swift
//  RecipeBrowser
//
//  Created by Saurabh Shetty on 7/16/24.
//

import Foundation
struct Meal: Identifiable, Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String?
    
    var id: String { idMeal }
}

struct MealDetail: Codable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strIngredient1: String?
    let strIngredient2: String?
    // Add more ingredients as needed
    
    var ingredients: [String] {
        return [strIngredient1, strIngredient2]
            .compactMap { $0 }
            .filter { !$0.isEmpty }
    }
}
