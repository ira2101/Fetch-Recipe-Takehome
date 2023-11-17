//
//  FTRecipeCardViewControllerModel2.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/14/23.
//

import Foundation

class FTRecipeCardViewControllerViewModel2 {
    
    var recipe: FTRecipe
    
    init(recipe: FTRecipe) {
        self.recipe = recipe
    }
    
    func createBackgroundImageModel() -> FTRecipeCardBackgroundImageViewModel2 {
        return FTRecipeCardBackgroundImageViewModel2(thumbnailImageURL: recipe.thumbnailImageURL)
    }
    
    func createVScrollModel() -> FTRecipeCardVScrollViewModel2 {
        return FTRecipeCardVScrollViewModel2(recipe: recipe)
    }
    
}
