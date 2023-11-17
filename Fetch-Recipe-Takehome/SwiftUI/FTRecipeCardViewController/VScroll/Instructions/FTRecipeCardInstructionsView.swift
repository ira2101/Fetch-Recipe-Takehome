//
//  FTRecipeCardInstructionsView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTRecipeCardInstructionsView: View {
    
    var model: FTRecipeCardInstructionsViewModel2
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Directions")
            .foregroundColor(.black)
            .font(.title3.weight(.semibold))
            
            VStack(spacing: 12) {
                ForEach(model.instructions.indices, id: \.self) { index in
                    FTRecipeCardInstructionItemView(
                        model: model.createItemModel(for: index)
                    )
                }
            }
        }
        .padding(16)
    }
}

//struct FTRecipeCardInstructionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FTRecipeCardInstructionsView()
//    }
//}
