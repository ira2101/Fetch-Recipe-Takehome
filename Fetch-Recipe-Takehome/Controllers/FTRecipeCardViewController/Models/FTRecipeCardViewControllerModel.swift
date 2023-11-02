//
//  FTRecipeCardViewControllerModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

class FTRecipeCardViewControllerModel {
    
    var recipe: FTRecipe
    
    init(recipe: FTRecipe) {
        self.recipe = recipe
    }
    
    func createBackgroundImageModel() -> FTRecipeCardBackgroundImageModel {
        return FTRecipeCardBackgroundImageModel(thumbnailImageURL: recipe.thumbnailImageURL)
    }
    
    func createVScrollModel() -> FTRecipeCardVScrollModel {
        return FTRecipeCardVScrollModel(recipe: recipe)
    }
    
}
