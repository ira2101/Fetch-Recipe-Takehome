//
//  FTFeedHeaderFilterBarModel2.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/14/23.
//

import Foundation
import Alamofire

class FTFeedHeaderFilterBarViewModel2: ObservableObject {
    
    @Published var categories: [FTCategory]?
    
    private var dataRequest: DataRequest?
    
    init() {
        readCategories()
    }
        
    func readCategories() {
        dataRequest = FTNetworking.readObject(
            type: FTCategoryResponseWrapper.self,
            uri: "/api/json/v1/1/categories.php"
        ) { result in
            switch result {
            case .success(let categoriesWrapper):
                let sortedCategories = categoriesWrapper.categories.sorted(by: {
                    $0.type < $1.type
                })
                
                self.categories = sortedCategories
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func createItemModel(for index: Int, category: FTCategory) -> FTFeedHeaderFilterBarItemViewModel2 {
        return FTFeedHeaderFilterBarItemViewModel2(index: index, category: category)
    }
    
    deinit {
        dataRequest?.cancel()
    }
    
}
