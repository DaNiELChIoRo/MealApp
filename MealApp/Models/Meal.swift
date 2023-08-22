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
