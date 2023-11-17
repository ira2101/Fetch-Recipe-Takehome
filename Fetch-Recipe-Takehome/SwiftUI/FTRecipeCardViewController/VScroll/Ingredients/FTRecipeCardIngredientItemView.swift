//
//  FTRecipeCardIngredientItemView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTRecipeCardIngredientItemView: View {
    
    var model: FTRecipeCardIngredientItemViewModel2
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            FTRecipeCardIngredientItemCheckmarkView()
            
            Text(model.ingredient.amount + " " + model.ingredient.name)
            .foregroundColor(.black)
            .font(.body.weight(.medium))
            .lineLimit(0)
            
            Spacer()
        }
    }
}

//struct FTRecipeCardIngredientItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        FTRecipeCardIngredientItemView()
//    }
//}
