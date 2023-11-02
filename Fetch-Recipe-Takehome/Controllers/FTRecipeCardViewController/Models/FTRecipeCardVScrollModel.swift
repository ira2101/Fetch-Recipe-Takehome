//
//  FTRecipeCardScrollModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

class FTRecipeCardVScrollModel {
    
    private var recipe: FTRecipe
    
    init(recipe: FTRecipe) {
        self.recipe = recipe
    }
    
    func createOverviewModel() -> FTRecipeCardOverviewModel {
        return FTRecipeCardOverviewModel(recipe: recipe)
    }
    
    func createIngredientsModel() -> FTRecipeCardIngredientsModel {
        return FTRecipeCardIngredientsModel(ingredients: recipe.ingredients)
    }
    
    func createInstructionsModel() -> FTRecipeCardInstructionsModel {
        return FTRecipeCardInstructionsModel(instructions: recipe.instructions)
    }
        
}
