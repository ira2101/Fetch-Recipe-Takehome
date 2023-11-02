//
//  FTFeedHeaderFilterBarDelegate.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

protocol FTFeedHeaderFilterBarDelegate: AnyObject {
    
    func ftFeedHeaderFilterBarDidChangeFilterTo(filter: String?)
    
}
