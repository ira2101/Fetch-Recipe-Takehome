//
//  FTRecipeCardOverviewView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/13/23.
//

import SwiftUI

struct FTRecipeCardOverviewView: View {
    
    var model: FTRecipeCardOverviewViewModel2
    
    @Binding var overviewPercentOffscreen: CGFloat
    
    var safeAreaInsets: EdgeInsets
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            titleLabel
            stats
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .background(.white)
        .background(
            GeometryReader { geometry in
                Color.clear.preference(
                    key: OverviewScrollOffsetPreferenceKey.self,
                    value: geometry.frame(in: .global)
                )
            }
        )
        .onPreferenceChange(OverviewScrollOffsetPreferenceKey.self) { value in
            handleScrollPosition(
                frame: value,
                topInset: safeAreaInsets.top
            )
        }
    }
    
    var titleLabel: some View {
        Text(model.recipe.mealName)
        .foregroundColor(.black)
        .font(.title.weight(.semibold))
        .lineLimit(0)
    }
    
    var stats: some View {
        HStack(alignment: .center, spacing: 8) {
            ingredientsLabel
            
            VStack(alignment: .leading) {
                Text("\u{2022}")
                .foregroundColor(
                    Color(uiColor: FTColorPalette.labelSecondary)
                )
                .font(.caption2.weight(.regular))
            }
            
            stepsLabel
        }
    }
    
    var ingredientsLabel: some View {
        Text(model.recipe.ingredients.count.formatted())
        .foregroundColor(.black)
        .font(.body.weight(.semibold))
        
        + Text(" ")
        .foregroundColor(.black)
        .font(.body.weight(.semibold))
        
        + Text(FTFormatter.pluralize("Ingredient", count: model.recipe.ingredients.count))
        .foregroundColor(
            Color(uiColor: FTColorPalette.labelSecondary)
        )
        .font(.body.weight(.regular))
    }
    
    var stepsLabel: some View {
        Text(model.recipe.instructions.count.formatted())
        .foregroundColor(.black)
        .font(.body.weight(.semibold))
        
        + Text(" ")
        .foregroundColor(.black)
        .font(.body.weight(.semibold))
        
        + Text(FTFormatter.pluralize("Step", count: model.recipe.instructions.count))
        .foregroundColor(
            Color(uiColor: FTColorPalette.labelSecondary)
        )
        .font(.body.weight(.regular))
    }
    
    func handleScrollPosition(frame: CGRect, topInset: CGFloat) {
        // Sometimes this function is called before this component has laid out its subviews
        if frame == .zero {
            return
        }
                
        // Get the top inset to account for the space that the navigation bar takes up
        let screenTopInset = topInset
    
        // Get the y position of the titleLabel
        let yPosition = frame.minY - screenTopInset

        // Calculate the percent offscreen that titleLabel is, so that the delegates
        // can adjust their alpha values by this percentage
        let percent = abs(yPosition) / frame.height
            
        // Somewhere in this interval [0, 1]
        let adjustedPercent = min(max(0, percent), 1.0)
        
        let cat = yPosition < 0 ? adjustedPercent : 0.0
            
        // if yPosition > 0 then adjustedPercent is invalid. Percentage will always
        // equal zero when yPosition > 0.
        overviewPercentOffscreen = yPosition < 0 ? adjustedPercent : 0.0
    }
    
}

struct OverviewScrollOffsetPreferenceKey: PreferenceKey {
    
    typealias Value = CGRect
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
    
}

//struct FTRecipeCardOverviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        FTRecipeCardOverviewView(
//            overviewPercentOffscreen: .constant(0),
//            safeAreaInsets: .init(.zero)
//        )
//    }
//}
