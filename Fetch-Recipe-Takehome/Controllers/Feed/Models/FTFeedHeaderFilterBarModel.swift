//
//  FTFeedHeaderFilterBarModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation
import Alamofire

class FTFeedHeaderFilterBarModel {
        
    func readCategories(_ completion: @escaping (Result<FTCategoryResponseWrapper, Error>) -> Void) {
        FTNetworking.readObject(
            type: FTCategoryResponseWrapper.self,
            uri: "/api/json/v1/1/categories.php"
        ) { result in
            completion(result)
        }
    }
    
    func createItemModel(for category: FTCategory) -> FTFeedHeaderFilterBarItemModel {
        return FTFeedHeaderFilterBarItemModel(category: category)
    }
    
}
