//
//  FTRecipeCardStepItemComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardInstructionItemComponent: FTVStack {
    
    private struct Props {
        var model: FTRecipeCardInstructionItemViewModel
    }
    
    private let props: Props

    init(model: FTRecipeCardInstructionItemViewModel) {
        props = Props(model: model)
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftAddArrangedSubview(
            StepLabel()
        )
        .ftAddArrangedSubview(
            DescriptionLabel()
        )
        .ftSpacing(16)
        .ftPadding(16)
        .ftBackgroundColor(.systemBackground)
        .ftCornerRadius(12)
    }
    
    private func StepLabel() -> UIView {
        return FTLabel()
        .ftText("Step \(props.model.instructionNumber.formatted())")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .body, weight: .bold)
    }
    
    private func DescriptionLabel() -> UIView {
        return FTLabel()
        .ftText(props.model.instruction.text)
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .body, weight: .regular)
        .ftNumberOfLines(0)
    }

}
