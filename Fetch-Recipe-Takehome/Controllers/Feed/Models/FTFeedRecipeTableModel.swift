//
//  FTFeedRecipeTableModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

class FTFeedRecipeTableModel {
    
    func readRecipes(completion: @escaping (Result<[FTRecipeOverview], Error>) -> Void) {
        FTNetworking.readObject(type: FTRecipeOverviewResponseWrapper.self, uri: "/api/json/v1/1/filter.php?c=Dessert") { result in
            switch result {
            case .success(let recipeOverviewWrapper):
                completion(.success(recipeOverviewWrapper.recipeOverviews))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
}
