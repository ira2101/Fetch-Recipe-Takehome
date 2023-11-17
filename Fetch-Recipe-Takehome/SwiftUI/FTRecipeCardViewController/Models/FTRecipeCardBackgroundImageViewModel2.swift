//
//  FTRecipeCardBackgroundImageModel2.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/14/23.
//

import Foundation
import UIKit
import Alamofire

class FTRecipeCardBackgroundImageViewModel2: ObservableObject {
    
    private var thumbnailImageURL: String
    
    private var imageRequest: DataRequest?
    
    @Published var image: UIImage?
    
    static var imageCache = NSCache<NSString, UIImage>()
    
    init(thumbnailImageURL: String) {
        self.thumbnailImageURL = thumbnailImageURL
        
        readThumbnailImage()
    }
    
    func readThumbnailImage() {
        if let cachedImage = Self.imageCache.object(forKey: thumbnailImageURL as NSString) {
            self.image = cachedImage
        }
        
        imageRequest = FTNetworking.readImage(url: thumbnailImageURL) { result in
            switch result {
            case .success(let image):
                guard let image = image else {
                    return
                }
                
                Self.imageCache.setObject(image, forKey: self.thumbnailImageURL as NSString)
                self.image = image
            default:
                break
            }
        }
    }
        
    deinit {
        imageRequest?.cancel()
    }
    
}
