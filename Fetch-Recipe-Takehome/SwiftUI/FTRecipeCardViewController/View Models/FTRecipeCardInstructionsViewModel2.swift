//
//  FTRecipeCardInstructionsModel2.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/14/23.
//

import Foundation

class FTRecipeCardInstructionsViewModel2 {
    
    var instructions: [FTInstruction]
    
    init(instructions: [FTInstruction]) {
        self.instructions = instructions
    }
    
    func createItemModel(for index: Int) -> FTRecipeCardInstructionItemViewModel2 {
        return FTRecipeCardInstructionItemViewModel2(
            instruction: instructions[index],
            instructionNumber: index + 1
        )
    }
    
}
