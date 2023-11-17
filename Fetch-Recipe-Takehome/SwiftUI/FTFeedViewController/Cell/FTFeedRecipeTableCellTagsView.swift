//
//  FTFeedRecipeTableCellTagsView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTFeedRecipeTableCellTagsView: View {
    
    var model: FTFeedRecipeTableCellTagsViewModel2
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 4) {
                ForEach(model.tags) { tag in
                    FTFeedRecipeTableCellTagItemView(tagName: tag.text)
                }
            }
        }
        .scrollIndicators(.never)
    }
}

//struct FTFeedRecipeTableCellTagsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FTFeedRecipeTableCellTagsView()
//    }
//}
