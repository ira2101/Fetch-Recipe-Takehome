//
//  FTRecipeHeaderView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTRecipeHeaderView: View {
    
    @Binding var activeCategory: String
    
    var body: some View {
        HStack {
            FTFeedHeaderFilterBarView(activeCategory: $activeCategory)
        }
        .padding(.vertical, 8)
    }
}
