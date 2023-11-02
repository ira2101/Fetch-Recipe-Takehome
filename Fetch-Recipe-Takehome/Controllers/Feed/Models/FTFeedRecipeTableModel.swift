//
//  FTFeedRecipeTableModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

class FTFeedRecipeTableModel {
    
    var recipeOverviews: [FTRecipeOverview]?
    
    func readRecipes(completion: @escaping (Result<Void, Error>) -> Void) {
        FTNetworking.readObject(type: FTRecipeOverviewResponseWrapper.self, uri: "/api/json/v1/1/filter.php?c=Dessert") { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let recipeOverviewWrapper):
                self.recipeOverviews = recipeOverviewWrapper.recipeOverviews
                
                completion(.success(()))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
}
