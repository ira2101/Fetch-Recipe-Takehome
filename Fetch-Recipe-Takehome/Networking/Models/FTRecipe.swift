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
        
    let area: String
    
    let instructions: [FTInstruction]
    
    let thumbnailImageURL: String
    
    let tags: [FTTag]
        
    let ingredients: [FTIngredient]
    
    enum CodingKeys: String, CodingKey {
        
        case id = "idMeal"
        
        case mealName = "strMeal"
                
        case area = "strArea"
        
        case thumbnailImageURL = "strMealThumb"
        
        case tags = "strTags"
        
        case instructions = "strInstructions"
                        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // These fields are given to us in their usable form
        id = try container.decode(String.self, forKey: .id)
        mealName = try container.decode(String.self, forKey: .mealName)
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
            
            guard let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey) else {
                continue
            }
            
            guard let measure = try container.decodeIfPresent(String.self, forKey: measureKey) else {
                continue
            }
            
            ingredientsTemp.append(FTIngredient(name: ingredient, amount: measure))
        }
        
        ingredients = ingredientsTemp
                
        // Tags are separated by commas
        let tagsRaw = try container.decode(String.self, forKey: .tags)
        
        tags = tagsRaw.split(separator: ",").map(String.init).map {
            FTTag(text: $0)
        }
        
        // Instuctions are separated by newlines
        let instructionsRaw = try container.decode(String.self, forKey: .instructions)
        
        instructions = instructionsRaw.split(separator: "\n").map(String.init).map {
            FTInstruction(text: $0)
        }
    }
    
}
