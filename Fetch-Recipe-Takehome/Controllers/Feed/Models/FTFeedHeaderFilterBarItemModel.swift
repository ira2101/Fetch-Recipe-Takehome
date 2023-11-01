//
//  FTFeedHeaderFilterBarItemModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation
import UIKit

class FTFeedHeaderFilterBarItemModel {
    
    var category: FTCategory
    
    init(category: FTCategory) {
        self.category = category
    }
    
    func readThumbnailImage(completion: @escaping (UIImage) -> Void) {
        FTNetworking.readImage(url: category.thumbnailImageURL) { result in
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
    
}
