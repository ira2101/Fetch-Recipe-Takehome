//
//  FTRecipeCardView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTFeedView: View {
        
    @State var activeCategory: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                FTRecipeHeaderView(activeCategory: $activeCategory)
                FTFeedRecipeTableView(
                    activeCategory: $activeCategory
                )
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Discover Recipes")
                    .foregroundColor(.black)
                    .font(.title2.weight(.semibold))
                }
            }
        }
    }
}

struct FTFeedView_Previews: PreviewProvider {
    static var previews: some View {
        FTFeedView()
    }
}
