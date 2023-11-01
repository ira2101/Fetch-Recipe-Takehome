//
//  FTRecipeCardIngredientComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardIngredientComponent: FTHStack {

    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        
    }
    
    private func TitleLabel() -> UIView {
        return FTLabel()
        .ftText("Ingredients")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .title3, weight: .semibold)
    }
    
}
