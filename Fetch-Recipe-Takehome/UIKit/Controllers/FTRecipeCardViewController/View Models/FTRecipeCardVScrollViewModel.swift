//
//  FTRecipeCardScrollModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

class FTRecipeCardVScrollViewModel {
    
    private var recipe: FTRecipe
    
    init(recipe: FTRecipe) {
        self.recipe = recipe
    }
    
    func createOverviewModel() -> FTRecipeCardOverviewViewModel {
        return FTRecipeCardOverviewViewModel(recipe: recipe)
    }
    
    func createIngredientsModel() -> FTRecipeCardIngredientsViewModel {
        return FTRecipeCardIngredientsViewModel(ingredients: recipe.ingredients)
    }
    
    func createInstructionsModel() -> FTRecipeCardInstructionsViewModel {
        return FTRecipeCardInstructionsViewModel(instructions: recipe.instructions)
    }
        
}
