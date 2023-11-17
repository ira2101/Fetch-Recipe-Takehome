//
//  FTRecipeCardIngredientsModel2.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/14/23.
//

import Foundation

class FTRecipeCardIngredientsViewModel2 {
    
    var ingredients: [FTIngredient]
    
    init(ingredients: [FTIngredient]) {
        self.ingredients = ingredients
    }
    
    func createItemModel(for ingredient: FTIngredient) -> FTRecipeCardIngredientItemViewModel2 {
        return FTRecipeCardIngredientItemViewModel2(ingredient: ingredient)
    }
    
}
