//
//  FTRecipeCardStepModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

class FTRecipeCardInstructionsViewModel {
    
    var instructions: [FTInstruction]
    
    init(instructions: [FTInstruction]) {
        self.instructions = instructions
    }
    
    func createItemModel(for index: Int) -> FTRecipeCardInstructionItemViewModel {
        return FTRecipeCardInstructionItemViewModel(
            instruction: instructions[index],
            instructionNumber: index + 1
        )
    }
    
}
