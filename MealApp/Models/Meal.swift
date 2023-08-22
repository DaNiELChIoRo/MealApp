//
//  Meal.swift
//  MealApp
//
//  Created by Daniel Meneses León on 22/08/23.
//

import Foundation

struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String

    // MARK: Optional Attributes
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
}

extension Meal: Identifiable {
    var id:String {
        return idMeal
    }
}

extension Meal: Hashable {
    
}

struct MealDetailsResponse: Codable {
    let meals: [Meal]
}
