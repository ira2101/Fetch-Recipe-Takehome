//
//  FTFeedRecipeTableModel2.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/14/23.
//

import Foundation
import Alamofire

class FTFeedRecipeTableViewModel2: ObservableObject {
        
    private var recipesRequest: DataRequest?
    
    @Published var recipeOverviews: [FTRecipeOverview]?
    
    init() {
        readRecipes()
    }
    
    func readRecipes(filter: String = "Dessert") {
        recipesRequest?.cancel()
        
        recipesRequest = FTNetworking.readObject(type: FTRecipeOverviewResponseWrapper.self, uri: "/api/json/v1/1/filter.php", parameters: ["c": filter]) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let recipeOverviewWrapper):
                let sortedRecipeOverviews = recipeOverviewWrapper.recipeOverviews.sorted(by: {
                    $0.mealName < $1.mealName
                })
                
                self.recipeOverviews = sortedRecipeOverviews
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func createTableCellModel(recipeOverview: FTRecipeOverview) -> FTFeedRecipeTableCellViewModel2 {
        return FTFeedRecipeTableCellViewModel2(recipeOverview: recipeOverview)
    }
    
    deinit {
        recipesRequest?.cancel()
    }
    
}
