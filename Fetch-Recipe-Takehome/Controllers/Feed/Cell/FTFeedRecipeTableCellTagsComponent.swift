//
//  FTRecipeTableCellTagsComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTFeedRecipeTableCellTagsComponent: FTHScrollStack {

    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftAddArrangedSubview(
            Tag()
        )
        .ftAddArrangedSubview(
            Tag()
        )
        .ftAddArrangedSubview(
            Tag()
        )
        .ftAlwaysBounceHorizontal(false)
        .ftshowsHorizontalScrollIndicator(false)
    }
    
    private func Tag() -> UIView {
        return FTHStack()
        .ftAddArrangedSubview(
            FTLabel()
            .ftText("Tag")
            .ftTextColor(FTColorPalette.labelSecondary)
            .ftFont(textStyle: .footnote, weight: .medium)
        )
        .ftPaddingHorizontal(8)
        .ftPaddingVertical(4)
        .ftCornerRadius(4)
        .ftBackgroundColor(UIColor(hex: 0xF8F8F8))
    }

}
