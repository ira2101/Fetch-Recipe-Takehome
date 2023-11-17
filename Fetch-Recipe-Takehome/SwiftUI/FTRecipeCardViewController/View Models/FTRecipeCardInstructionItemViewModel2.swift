//
//  FTRecipeCardInstructionItemModel2.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/14/23.
//

import Foundation

class FTRecipeCardInstructionItemViewModel2 {
    
    var instruction: FTInstruction
    
    var instructionNumber: Int
        
    init(instruction: FTInstruction, instructionNumber: Int) {
        self.instruction = instruction
        self.instructionNumber = instructionNumber
    }
    
}
