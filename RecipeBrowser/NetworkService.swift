//
//  NetworkService.swift
//  RecipeBrowser
//
//  Created by Saurabh Shetty on 7/16/24.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private init() {}
    
    private let baseURL = "https://themealdb.com/api/json/v1/1/"
    
    func fetchMeals() async throws -> [Meal] {
        let url = URL(string: baseURL + "filter.php?c=Dessert")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealResponse.self, from: data)
        return response.meals.sorted { $0.strMeal < $1.strMeal }
    }
    
    func fetchMealDetail(id: String) async throws -> MealDetail {
        let url = URL(string: baseURL + "lookup.php?i=\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealDetailResponse.self, from: data)
        return response.meals.first!
    }
}

struct MealResponse: Codable {
    let meals: [Meal]
}

struct MealDetailResponse: Codable {
    let meals: [MealDetail]
}
