//
//  NetworkManager.swift
//  MealApp
//
//  Created by Daniel Meneses León on 22/08/23.
//

import Foundation

enum NetworkError: Error {
    case emptyResponse
    case invalidHTTPCode
    case customError(error: String)
}

class NetworkManager {
    static let shared = NetworkManager()
    private let baseEndpoint = "https://www.themealdb.com/api/json/v1/1/"
    private lazy var decoder = {
        JSONDecoder()
    }()

    private init() {}

    /// Fetch all meals by Dessert category
    func fetchMeals(_ category: String = "Dessert") async throws -> [Meal] {
        let endpoint = baseEndpoint + "filter.php?c=\(category)"
        if let url = URL(string: endpoint) {
            do {
                let (data, urlResponse) = try await URLSession.shared.data(from: url)

                guard let httpResponse = urlResponse as? HTTPURLResponse,
                    200...299 ~= httpResponse.statusCode else {
                    throw NetworkError.invalidHTTPCode
                }
                let meals = try decoder.decode(MealDetailsResponse.self, from: data)
                return meals.meals
            } catch {
                debugPrint(error.localizedDescription)
                throw NetworkError.customError(error: error.localizedDescription)
            }
        }

        throw NetworkError.emptyResponse
    }

    func fetchMealDetails(for mealID: String) async throws -> Meal {
        let endpoint = baseEndpoint + "/lookup.php?1=\(mealID)"
        if let url = URL(string: endpoint) {
            do {
                let (data, urlResponse) = try await URLSession.shared.data(from: url)

                guard let httpResponse = urlResponse as? HTTPURLResponse,
                    200...299 ~= httpResponse.statusCode else {
                    throw NetworkError.invalidHTTPCode
                }
                let meals = try decoder.decode(MealDetailsResponse.self, from: data)
                return meals.meals.first!
            } catch {
                throw NetworkError.customError(error: error.localizedDescription)
            }
        }

        throw NetworkError.emptyResponse
    }
}
