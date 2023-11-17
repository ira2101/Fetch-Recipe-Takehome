//
//  FTRecipeCardVScrollModel2.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/14/23.
//

import Foundation

class FTRecipeCardVScrollViewModel2 {
    
    private var recipe: FTRecipe
    
    init(recipe: FTRecipe) {
        self.recipe = recipe
    }
    
    func createOverviewModel() -> FTRecipeCardOverviewViewModel2 {
        return FTRecipeCardOverviewViewModel2(recipe: recipe)
    }
    
    func createIngredientsModel() -> FTRecipeCardIngredientsViewModel2 {
        return FTRecipeCardIngredientsViewModel2(ingredients: recipe.ingredients)
    }
    
    func createInstructionsModel() -> FTRecipeCardInstructionsViewModel2 {
        return FTRecipeCardInstructionsViewModel2(instructions: recipe.instructions)
    }
        
}
