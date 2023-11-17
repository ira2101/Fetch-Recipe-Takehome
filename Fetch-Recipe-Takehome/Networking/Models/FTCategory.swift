//
//  FTCategory.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

struct FTCategory: Decodable, Identifiable {
    
    let id: String
    
    let type: String
    
    let thumbnailImageURL: String
    
    let description: String

    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case type = "strCategory"
        case thumbnailImageURL = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
    
}

struct FTCategoryResponseWrapper: Decodable {
    
    let categories: [FTCategory]
    
}
