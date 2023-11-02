//
//  FTRecipeCardStepComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardInstructionsComponent: FTVStack {
    
    private struct Props {
        var model: FTRecipeCardInstructionsModel
    }
    
    private let props: Props

    init(model: FTRecipeCardInstructionsModel) {
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
        .ftText("Directions")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .title3, weight: .semibold)
    }
    
    private func List() -> UIView {
        return FTVStack()
        .ftAddArrangedSubview(Array(0..<props.model.instructions.count)) {
            return FTRecipeCardInstructionItemComponent(
                model: props.model.createItemModel(for: $0)
            )
        }
        .ftSpacing(12)
    }

}
