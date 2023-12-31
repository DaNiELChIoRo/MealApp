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

    // MARK: Ingredients
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
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?

    // MARK: Measurements
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
}

extension Meal {
    var ingredients: [String] {
        var ingredients = [String]()
        let mirror = Mirror(reflecting: self)
        for attr in mirror.children {
            if let attribute = attr.label,
               attribute.contains("Ingredient"),
               let value = attr.value as? String,
                !value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                ingredients.append(value)
            }
        }
        return ingredients
    }

    var measurements: [String] {
        var measurements = [String]()
        let mirror = Mirror(reflecting: self)
        for attr in mirror.children {
            if let attribute = attr.label,
               attribute.contains("Measure"),
               let value = attr.value as? String,
               !value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                measurements.append(value)
            }
        }
        return measurements
    }
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
