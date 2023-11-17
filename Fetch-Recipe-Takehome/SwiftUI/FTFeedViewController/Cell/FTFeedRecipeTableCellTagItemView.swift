//
//  FTFeedRecipeTableCellTagItemView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTFeedRecipeTableCellTagItemView: View {
    
    var tagName: String
    
    var body: some View {
        HStack {
            Text(tagName)
            .font(.caption.weight(.medium))
            .foregroundColor(.secondary)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color(uiColor: UIColor(hex: 0xF8F8F8)))
        .cornerRadius(4)
    }
}

struct FTFeedRecipeTableCellTagItemView_Previews: PreviewProvider {
    static var previews: some View {
        FTFeedRecipeTableCellTagItemView(tagName: "Tag")
    }
}
