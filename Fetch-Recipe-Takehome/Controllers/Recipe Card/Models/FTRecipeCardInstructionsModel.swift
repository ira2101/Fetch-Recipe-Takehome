//
//  FTRecipeCardStepModel.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import Foundation

class FTRecipeCardInstructionsModel {
    
    var instructions: [FTInstruction]
    
    init(instructions: [FTInstruction]) {
        self.instructions = instructions
    }
    
    func createItemModel(for instruction: FTInstruction) -> FTRecipeCardInstructionItemModel {
        return FTRecipeCardInstructionItemModel(instruction: instruction)
    }
    
}
