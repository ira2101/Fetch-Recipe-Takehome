//
//  FTIngredient.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

struct FTIngredient: Identifiable {
    
    let name: String
    
    /// 1 cup, 1/2 tablespoon, ...
    let amount: String
    
    var id: String { name }
    
}
