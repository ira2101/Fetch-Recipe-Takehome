//
//  FTRecipe.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

struct FTRecipe: Decodable {
    
    let id: String
    
    let mealName: String
    
    let category: String
        
    let area: String
    
    let instructions: [FTInstruction]
    
    let thumbnailImageURL: String
    
    let tags: [FTTag]?
        
    let ingredients: [FTIngredient]
    
    enum CodingKeys: String, CodingKey {
        
        case id = "idMeal"
        
        case mealName = "strMeal"
        
        case category = "strCategory"
                
        case area = "strArea"
        
        case thumbnailImageURL = "strMealThumb"
        
        case tags = "strTags"
        
        case instructions = "strInstructions"
        
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5
        case strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15
        case strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20

        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5
        case strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15
        case strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // These fields are given to us in their usable form
        id = try container.decode(String.self, forKey: .id)
        mealName = try container.decode(String.self, forKey: .mealName)
        category = try container.decode(String.self, forKey: .category)
        area = try container.decode(String.self, forKey: .area)
        thumbnailImageURL = try container.decode(String.self, forKey: .thumbnailImageURL)
        
        var ingredientsTemp: [FTIngredient] = []
                
        // There are between 1 and 20 ingredients
        for i in 1...20 {
            let ingredientKey = CodingKeys(stringValue: "strIngredient\(i)")
            let measureKey = CodingKeys(stringValue: "strMeasure\(i)")
            
            guard let ingredientKey = ingredientKey else {
                continue
            }
            
            guard let measureKey = measureKey else {
                continue
            }
            
            guard let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey), !ingredient.isEmpty else {
                continue
            }
            
            guard let measure = try container.decodeIfPresent(String.self, forKey: measureKey) else {
                continue
            }
                        
            ingredientsTemp.append(FTIngredient(name: ingredient, amount: measure))
        }
        
        ingredients = ingredientsTemp
                
        // Tags are separated by commas
        let tagsRaw = try container.decodeIfPresent(String.self, forKey: .tags)
        
        tags = tagsRaw?.split(separator: ",").map(String.init).map {
            FTTag(text: $0)
        }
        
        // Instuctions are separated by newlines
        let instructionsRaw = try container.decode(String.self, forKey: .instructions)
        
        instructions = instructionsRaw.split(separator: "\r\n").map(String.init).map {
            FTInstruction(text: $0)
        }
    }
    
}

struct FTRecipeResponseWrapper: Decodable {
    
    let recipe: [FTRecipe]
    
    enum CodingKeys: String, CodingKey {
        case recipe = "meals"
    }
    
}
