//
//  FTRecipeCardStepItemComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardStepItemComponent: FTVStack {

    override init() {
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
        .ftText("Step 0")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .body, weight: .heavy)
    }
    
    private func DescriptionLabel() -> UIView {
        return FTLabel()
        .ftText("Bring a large pot of water to boil")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .subheadline, weight: .regular)
        .ftNumberOfLines(0)
    }

}
