Recipe Browser App

This native iOS app allows users to browse dessert recipes using the MealDB API(https://themealdb.com/api.php). The app utilizes Swift Concurrency (async/await) for all asynchronous operations.

Features:

    Browse Dessert Recipes: Fetches and displays a list of dessert meals from the MealDB API, sorted alphabetically.
    
    View Recipe Details: Users can select a meal to view detailed information including:

      Meal Name
      Instructions
      Ingredients with Measurements

Technologies Used:

    Swift Concurrency: All asynchronous operations are handled using async/await for improved readability and maintainability.
    
    MealDB API: Utilizes the MealDB API endpoints (https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID) to fetch and display recipe data.

Requirements:

    Xcode Compatibility: The project is compatible with the latest version of Xcode.
    
    SwiftUI (Preferred): Designed using SwiftUI for the user interface. UIKit is also acceptable if SwiftUI was not used.

Installation:

  To run the project locally:

    Clone the repository. 
    Open the project in Xcode. 
    Build and run the project on a simulator or device.

