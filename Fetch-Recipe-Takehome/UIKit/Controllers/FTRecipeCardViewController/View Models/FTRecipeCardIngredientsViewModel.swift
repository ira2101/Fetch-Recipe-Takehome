//
//  FTRecipeCardIngredientModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

class FTRecipeCardIngredientsViewModel {
    
    var ingredients: [FTIngredient]
    
    init(ingredients: [FTIngredient]) {
        self.ingredients = ingredients
    }
    
    func createItemModel(for ingredient: FTIngredient) -> FTRecipeCardIngredientItemViewModel {
        return FTRecipeCardIngredientItemViewModel(ingredient: ingredient)
    }
    
}
