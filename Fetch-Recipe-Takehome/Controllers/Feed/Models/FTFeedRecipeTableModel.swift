//
//  FTFeedRecipeTableModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.d
//

import Foundation
import Alamofire

class FTFeedRecipeTableModel {
    
    var recipeOverviews: [FTRecipeOverview]?
    
    private var recipesRequest: DataRequest?
    
    func readRecipes(filter: String = "Dessert", completion: @escaping (Result<[FTRecipeOverview], Error>) -> Void) {
        recipesRequest?.cancel()
        
        recipesRequest = FTNetworking.readObject(type: FTRecipeOverviewResponseWrapper.self, uri: "/api/json/v1/1/filter.php", parameters: ["c": filter]) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let recipeOverviewWrapper):
                let sortedRecipeOverviews = recipeOverviewWrapper.recipeOverviews.sorted(by: {
                    $0.mealName < $1.mealName
                })
                
                self.recipeOverviews = sortedRecipeOverviews
                
                completion(.success(sortedRecipeOverviews))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    func createTableCellModel(recipeOverview: FTRecipeOverview) -> FTFeedRecipeTableCellModel {
        return FTFeedRecipeTableCellModel(recipeOverview: recipeOverview)
    }
    
}
