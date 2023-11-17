//
//  FTInstruction.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

struct FTInstruction: Identifiable {
    
    let text: String
    
    var id: String { text }
    
}
