//
//  FTRecipeCardIngredientItemComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardIngredientItemComponent: FTHStack {
    
    private struct Props {
        var model: FTRecipeCardIngredientItemModel
    }
    
    private let props: Props

    init(model: FTRecipeCardIngredientItemModel) {
        props = Props(model: model)
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftAddArrangedSubview(
            Checkmark()
        )
        .ftAddArrangedSubview(
            Label()
        )
        .ftSpacing(12)
        .ftAlignment(.center)
    }
    
    private func Label() -> UIView {
        return FTLabel()
        .ftText(props.model.ingredient.amount + " " + props.model.ingredient.name)
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .body, weight: .medium)
        .ftNumberOfLines(0)
    }
    
    private func Checkmark() -> UIView {
        return FTRecipeCardIngredientItemCheckmarkComponent()
    }

}
