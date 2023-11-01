//
//  FTRecipeCardScrollComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardScrollComponent: FTVScrollStack {

    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftAddArrangedSubview(
            Title()
        )
        .ftAddArrangedSubview(
            Information()
        )
    }
    
    private func Title() -> UIView {
        return FTRecipeCardTitleComponent()
    }
    
    private func Information() -> UIView {
        return FTVStack()
        .ftAddArrangedSubview(
            Ingredients()
        )
        .ftAddArrangedSubview(
            Steps()
        )
        .ftBackgroundColor(UIColor(hex: 0xF6F6F8))
    }
    
    private func Ingredients() -> UIView {
        return FTRecipeCardIngredientComponent()
    }
    
    private func Steps() -> UIView {
        return FTRecipeCardStepComponent()
    }

}
