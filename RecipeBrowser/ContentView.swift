//
//  ContentView.swift
//  RecipeBrowser
//
//  Created by Saurabh Shetty on 7/16/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MealViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.meals) { meal in
                NavigationLink(destination: MealDetailView(mealID: meal.idMeal)) {
                    Text(meal.strMeal)
                }
            }
            .navigationTitle("Desserts")
            .task {
                await viewModel.fetchMeals()
            }
        }
    }
}

struct MealDetailView: View {
    let mealID: String
    @StateObject private var viewModel = MealViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let meal = viewModel.selectedMealDetail {
                Text(meal.strMeal)
                    .font(.title)
                    .bold()
                Text(meal.strInstructions)
                ForEach(meal.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
            } else {
                ProgressView("Loading...")
            }
        }
        .padding()
        .navigationTitle("Meal Details")
        .task {
            await viewModel.fetchMealDetail(id: mealID)
        }
    }
}
