//
//  FTNetworking.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation
import Alamofire
import UIKit

class FTNetworking {
    
    static let baseURL = "https://www.themealdb.com"
    
    /// The json contains the full image paths, so we can just pass in the iamge path
    static func readImage(url: String, completion: @escaping (Result<UIImage?, Error>) -> Void) -> DataRequest {
        return AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                let image = UIImage(data: data)
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func readObject<T : Decodable>(type: T.Type, uri: String, parameters: Parameters? = nil, completion: @escaping (Result<T, Error>) -> Void) -> DataRequest {
        return AF.request(baseURL + uri, parameters: parameters).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
        
}
