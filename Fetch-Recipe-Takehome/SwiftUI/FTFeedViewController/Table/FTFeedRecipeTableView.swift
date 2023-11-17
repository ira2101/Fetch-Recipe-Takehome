//
//  FTFeedRecipeTableView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTFeedRecipeTableView: View {
    
    @StateObject var model: FTFeedRecipeTableViewModel2 = FTFeedRecipeTableViewModel2()
        
    @Binding var activeCategory: String
    
    var body: some View {
        if let recipeOverviews = model.recipeOverviews {
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(recipeOverviews) { recipeOverview in
                        FTFeedRecipeTableCellView(
                            model: model.createTableCellModel(
                                recipeOverview: recipeOverview
                            )
                        )
                    }
                    .onChange(of: activeCategory) { newValue in
                        model.readRecipes(filter: newValue)
                    }
                }
            }
        }
    }
}

//struct FTFeedRecipeTableView_Previews: PreviewProvider {
//    static var previews: some View {
//        FTFeedRecipeTableView(presentRecipeView: .constant(false))
//    }
//}
