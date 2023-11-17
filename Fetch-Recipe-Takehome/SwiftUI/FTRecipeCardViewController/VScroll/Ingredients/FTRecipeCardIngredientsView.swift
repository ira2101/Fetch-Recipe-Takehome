//
//  FTRecipeCardIngredientsView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTRecipeCardIngredientsView: View {
    
    var model: FTRecipeCardIngredientsViewModel2
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Ingredients")
            .foregroundColor(.black)
            .font(.title3.weight(.semibold))
            
            VStack(spacing: 12) {
                ForEach(model.ingredients) { ingredient in
                    FTRecipeCardIngredientItemView(
                        model: model.createItemModel(for: ingredient)
                    )
                }
            }
        }
        .padding(16)
    }
}

//struct FTRecipeCardIngredientsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FTRecipeCardIngredientsView()
//    }
//}
