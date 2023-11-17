//
//  FTFeedHeaderFilterBarView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTFeedHeaderFilterBarView: View {
    
    @StateObject var model: FTFeedHeaderFilterBarViewModel2 = FTFeedHeaderFilterBarViewModel2()
    
    @Binding var activeCategory: String
        
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                if let categories = model.categories {
                    ForEach(categories.indices, id: \.self) { index in
                        FTFeedHeaderFilterBarItemView(
                            model: model.createItemModel(for: index, category: categories[index]),
                            activeCategory: $activeCategory
                        )
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
    }
}
