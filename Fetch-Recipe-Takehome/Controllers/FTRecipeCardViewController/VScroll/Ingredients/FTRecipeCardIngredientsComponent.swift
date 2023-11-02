//
//  FTRecipeCardIngredientComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardIngredientsComponent: FTVStack {
    
    private struct Props {
        var model: FTRecipeCardIngredientsModel
    }
    
    private let props: Props

    init(model: FTRecipeCardIngredientsModel) {
        props = Props(model: model)
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
        return FTVStack()
        .ftAddArrangedSubview(props.model.ingredients) {
            return FTRecipeCardIngredientItemComponent(
                model: props.model.createItemModel(for: $0)
            )
        }
        .ftSpacing(12)
    }
    
}
