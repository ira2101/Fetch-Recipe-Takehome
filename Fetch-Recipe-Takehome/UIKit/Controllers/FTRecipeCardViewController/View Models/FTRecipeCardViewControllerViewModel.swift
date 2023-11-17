//
//  FTRecipeCardViewControllerModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

class FTRecipeCardViewControllerViewModel {
    
    var recipe: FTRecipe
    
    init(recipe: FTRecipe) {
        self.recipe = recipe
    }
    
    func createBackgroundImageModel() -> FTRecipeCardBackgroundImageViewModel {
        return FTRecipeCardBackgroundImageViewModel(thumbnailImageURL: recipe.thumbnailImageURL)
    }
    
    func createVScrollModel() -> FTRecipeCardVScrollViewModel {
        return FTRecipeCardVScrollViewModel(recipe: recipe)
    }
    
}
