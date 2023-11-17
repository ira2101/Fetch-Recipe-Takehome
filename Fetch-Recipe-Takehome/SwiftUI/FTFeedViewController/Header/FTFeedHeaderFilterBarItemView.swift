//
//  FTFeedHeaderFilterBarItemView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTFeedHeaderFilterBarItemView: View {
    
    @ObservedObject var model: FTFeedHeaderFilterBarItemViewModel2
        
    @Binding var activeCategory: String
    
    init(model: FTFeedHeaderFilterBarItemViewModel2, activeCategory: Binding<String>) {
        self.model = model
        self._activeCategory = activeCategory
        
        if model.index == 0 {
            self.activeCategory = model.category.type
        }
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Text(model.category.type)
            .font(.subheadline.weight(.medium))
            .foregroundColor(.black)
            
            if let image = model.image {
                Image(uiImage: image)
                .resizable()
                .frame(width: 28, height: 28)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(.greatestFiniteMagnitude)
            }
            else {
                Rectangle()
                .fill(Color(uiColor: FTColorPalette.placeholder))
                .frame(width: 28, height: 28)
                .cornerRadius(.greatestFiniteMagnitude)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .overlay(
            Capsule()
            .strokeBorder(
                activeCategory == model.category.type ? Color(uiColor: FTColorPalette.primary) : Color(uiColor: UIColor(hex: 0xE9E9E9)),
                lineWidth: activeCategory == model.category.type ? 2.0 : 1.0
            )
        )
        .background(
            activeCategory == model.category.type
            ? Color(uiColor: UIColor(hex: 0xFCF3DB))
            : .clear
        )
        .cornerRadius(.greatestFiniteMagnitude)
        .onTapGesture {
            activeCategory = model.category.type
        }
    }
}
