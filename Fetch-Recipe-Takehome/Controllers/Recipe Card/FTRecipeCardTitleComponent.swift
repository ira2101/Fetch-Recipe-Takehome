//
//  FTRecipeCardTitleComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardTitleComponent: FTHStack {
    
    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftAddArrangedSubview(
            Label()
        )
        .ftPaddingHorizontal(16)
        .ftPaddingVertical(24)
        .ftBackgroundColor(.systemBackground)
    }
    
    private func Label() -> UIView {
        return FTLabel()
        .ftText("Title")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .title2, weight: .semibold)
        .ftNumberOfLines(0)
    }

}
