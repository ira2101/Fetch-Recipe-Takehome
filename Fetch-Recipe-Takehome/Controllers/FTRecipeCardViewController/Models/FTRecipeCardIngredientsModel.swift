//
//  FTRecipeCardIngredientModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

class FTRecipeCardIngredientsModel {
    
    var ingredients: [FTIngredient]
    
    init(ingredients: [FTIngredient]) {
        self.ingredients = ingredients
    }
    
    func createItemModel(for ingredient: FTIngredient) -> FTRecipeCardIngredientItemModel {
        return FTRecipeCardIngredientItemModel(ingredient: ingredient)
    }
    
}
