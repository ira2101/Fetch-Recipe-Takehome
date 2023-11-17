//
//  FTRecipeCardImageBackgroundModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation
import Alamofire
import UIKit

class FTRecipeCardBackgroundImageViewModel {
    
    private var thumbnailImageURL: String
    
    private var imageRequest: DataRequest?
    
    init(thumbnailImageURL: String) {
        self.thumbnailImageURL = thumbnailImageURL
    }
    
    func readThumbnailImage(completion: @escaping (UIImage) -> Void) {
        imageRequest = FTNetworking.readImage(url: thumbnailImageURL) { result in
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
        
    deinit {
        imageRequest?.cancel()
    }
    
}
