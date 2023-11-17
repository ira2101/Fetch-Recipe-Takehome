//
//  FTRecipeCardStepItemModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

class FTRecipeCardInstructionItemViewModel {
    
    var instruction: FTInstruction
    
    var instructionNumber: Int
        
    init(instruction: FTInstruction, instructionNumber: Int) {
        self.instruction = instruction
        self.instructionNumber = instructionNumber
    }
    
}
