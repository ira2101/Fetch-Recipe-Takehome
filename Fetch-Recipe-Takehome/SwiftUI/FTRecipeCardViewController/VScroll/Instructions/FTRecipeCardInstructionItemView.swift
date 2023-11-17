//
//  FTRecipeCardInstructionItemView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTRecipeCardInstructionItemView: View {
    
    var model: FTRecipeCardInstructionItemViewModel2
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Step \(model.instructionNumber)")
            .foregroundColor(.black)
            .font(.body.weight(.bold))
            .lineLimit(0)
            
            Text(model.instruction.text)
            .foregroundColor(.black)
            .font(.body.weight(.regular))
            .lineLimit(0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(.white)
        .cornerRadius(12)
    }
}

//struct FTRecipeCardInstructionItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        FTRecipeCardInstructionItemView()
//    }
//}
