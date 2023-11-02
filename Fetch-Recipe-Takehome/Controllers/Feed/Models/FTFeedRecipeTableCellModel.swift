//
//  FTFeedRecipeTableCellModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

class FTFeedRecipeTableCellModel {
    
    private var recipeOverview: FTRecipeOverview
    
    var recipe: FTRecipe?
    
    init(recipeOverview: FTRecipeOverview) {
        self.recipeOverview = recipeOverview
    }
        
    func readRecipe(completion: @escaping (FTRecipe) -> Void) {
        FTNetworking.readObject(type: FTRecipeResponseWrapper.self, uri: "/api/json/v1/1/lookup.php", parameters: ["i": recipeOverview.id]) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let recipeWrapper):
                guard let recipe = recipeWrapper.recipe.first else {
                    return
                }
                
                self.recipe = recipe
                completion(recipe)
            case .failure(let failure):
                print(failure)
                break
            }
        }
    }
    
}
