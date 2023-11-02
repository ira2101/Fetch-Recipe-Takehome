//
//  FTFeedRecipeTableCellModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation
import Alamofire
import UIKit

class FTFeedRecipeTableCellModel {
    
    private var recipeOverview: FTRecipeOverview
    
    var recipe: FTRecipe?
    
    private var recipeRequest: DataRequest?
    
    private var imageRequest: DataRequest?
    
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
    
    func readThumbnailImage(completion: @escaping (UIImage) -> Void) {
        guard let recipe = recipe else {
            return
        }
        
        imageRequest = FTNetworking.readImage(url: recipe.thumbnailImageURL) { result in
            switch result {
            case .success(let image):
                guard let image = image else {
                    return
                }
                
                completion(image)
            default:
                break
            }
        }
    }
    
    func createTagsModel() -> FTFeedRecipeTableCellTagsModel {
        return FTFeedRecipeTableCellTagsModel(tags: recipe?.tags ?? [])
    }
    
    func createRecipeCardModel() -> FTRecipeCardViewControllerModel? {
        guard let recipe = recipe else {
            return nil
        }
        
        return FTRecipeCardViewControllerModel(recipe: recipe)
    }
    
    deinit {
        recipeRequest?.cancel()
        imageRequest?.cancel()
    }
    
}
