//
//  MealViewModel.swift
//  RecipeBrowser
//
//  Created by Saurabh Shetty on 7/16/24.
//

import Foundation

@MainActor
class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var selectedMealDetail: MealDetail?

    func fetchMeals() async {
        do {
            self.meals = try await NetworkService.shared.fetchMeals()
        } catch {
            print("Error fetching meals: \(error)")
        }
    }
    
    func fetchMealDetail(id: String) async {
        do {
            self.selectedMealDetail = try await NetworkService.shared.fetchMealDetail(id: id)
        } catch {
            print("Error fetching meal detail: \(error)")
        }
    }
}
