//
//  FTRecipeCardIngredientComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardIngredientComponent: FTVStack {

    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftAddArrangedSubview(
            TitleLabel()
        )
        .ftAddArrangedSubview(
            List()
        )
        .ftSpacing(16)
        .ftPadding(16)
    }
    
    private func TitleLabel() -> UIView {
        return FTLabel()
        .ftText("Ingredients")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .title3, weight: .semibold)
    }
    
    private func List() -> UIView {
        let ingredients = ["One, two, three"]
        
        return FTVStack()
        .ftAddArrangedSubview(forEach: ingredients) { ingredient in
            return FTRecipeCardIngredientItemComponent()
        }
        .ftSpacing(12)
    }
    
}
