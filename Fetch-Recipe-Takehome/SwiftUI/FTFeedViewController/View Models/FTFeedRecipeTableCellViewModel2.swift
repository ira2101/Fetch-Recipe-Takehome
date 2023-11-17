//
//  FTFeedRecipeTableCellModel2.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/14/23.
//

import Foundation
import Alamofire
import UIKit

class FTFeedRecipeTableCellViewModel2: ObservableObject {
    
    private var recipeOverview: FTRecipeOverview
    
    @Published var recipe: FTRecipe? {
        didSet {
            readThumbnailImage()
        }
    }
    
    @Published var image: UIImage?
    
    private var recipeRequest: DataRequest?
    
    private var imageRequest: DataRequest?
    
    init(recipeOverview: FTRecipeOverview) {
        self.recipeOverview = recipeOverview
        
        readRecipe()
    }
        
    func readRecipe() {
        recipeRequest = FTNetworking.readObject(type: FTRecipeResponseWrapper.self, uri: "/api/json/v1/1/lookup.php", parameters: ["i": recipeOverview.id]) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let recipeWrapper):
                guard let recipe = recipeWrapper.recipe.first else {
                    return
                }
                
                self.recipe = recipe
            case .failure(let failure):
                print(failure)
                break
            }
        }
    }
    
    func readThumbnailImage() {
        guard let recipe = recipe else {
            return
        }
        
        imageRequest = FTNetworking.readImage(url: recipe.thumbnailImageURL) { result in
            switch result {
            case .success(let image):
                guard let image = image else {
                    return
                }
                
                self.image = image
            default:
                break
            }
        }
    }
    
    func createTagsModel() -> FTFeedRecipeTableCellTagsViewModel2 {
        return FTFeedRecipeTableCellTagsViewModel2(tags: recipe?.tags ?? [])
    }
    
    func createRecipeCardModel() -> FTRecipeCardViewControllerViewModel2? {
        guard let recipe = recipe else {
            return nil
        }
        
        return FTRecipeCardViewControllerViewModel2(recipe: recipe)
    }
    
    deinit {
        recipeRequest?.cancel()
        imageRequest?.cancel()
    }
    
}
