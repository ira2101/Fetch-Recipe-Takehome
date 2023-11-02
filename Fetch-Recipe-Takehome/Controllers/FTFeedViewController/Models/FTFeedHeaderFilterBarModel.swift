//
//  FTFeedHeaderFilterBarModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation
import Alamofire

class FTFeedHeaderFilterBarModel {
        
    func readCategories(_ completion: @escaping (Result<[FTCategory], Error>) -> Void) {
        FTNetworking.readObject(
            type: FTCategoryResponseWrapper.self,
            uri: "/api/json/v1/1/categories.php"
        ) { result in
            switch result {
            case .success(let categoriesWrapper):
                let sortedCategories = categoriesWrapper.categories.sorted(by: {
                    $0.type < $1.type
                })
                
                completion(.success(sortedCategories))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    func createItemModel(for category: FTCategory) -> FTFeedHeaderFilterBarItemModel {
        return FTFeedHeaderFilterBarItemModel(category: category)
    }
    
}
