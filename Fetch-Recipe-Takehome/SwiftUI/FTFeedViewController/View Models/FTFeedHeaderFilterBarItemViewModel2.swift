//
//  FTFeedHeaderFilterBarItemModel2.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/14/23.
//

import Foundation
import UIKit
import Alamofire

class FTFeedHeaderFilterBarItemViewModel2: ObservableObject {
    
    var category: FTCategory
    
    @Published var image: UIImage?
    
    var index: Int
    
    private var dataRequest: DataRequest?
    
    init(index: Int, category: FTCategory) {
        self.category = category
        self.index = index
        
        readThumbnailImage()
    }
    
    func readThumbnailImage() {
        dataRequest = FTNetworking.readImage(url: category.thumbnailImageURL) { result in
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
    
    deinit {
        dataRequest?.cancel()
    }
    
}
