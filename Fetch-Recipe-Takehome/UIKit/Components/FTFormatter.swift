//
//  FTFormatter.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import Foundation


class FTFormatter {
    
    /// Decides whether, for example, 'like' should become 'likes'
    static func pluralize(_ string: String, count: Int) -> String {
        if count == 1 {
            return string
        }
        
        return string + "s"
    }
    
}
