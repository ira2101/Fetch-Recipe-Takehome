//
//  FTRecipeOverview.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

struct FTRecipeOverview: Decodable, Identifiable {
    
    let id: String
    
    let thumbnailImageURL: String
    
    let mealName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case thumbnailImageURL = "strMealThumb"
        case mealName = "strMeal"
    }
    
}

struct FTRecipeOverviewResponseWrapper: Decodable {
    
    let recipeOverviews: [FTRecipeOverview]
    
    enum CodingKeys: String, CodingKey {
        case recipeOverviews = "meals"
    }
    
}
