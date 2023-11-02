//
//  FTFeedRecipeTableCellTagItemComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/1/23.
//

import UIKit

class FTFeedRecipeTableCellTagItemComponent: FTHStack {
    
    private var label: FTLabel!

    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftAddArrangedSubview(
            Label()
        )
        .ftPaddingHorizontal(8)
        .ftPaddingVertical(4)
        .ftCornerRadius(4)
        .ftBackgroundColor(UIColor(hex: 0xF8F8F8))
        .ftIsHidden(true)
    }
    
    private func Label() -> UIView {
        label =
        FTLabel()
        .ftText("Tag")
        .ftTextColor(FTColorPalette.labelSecondary)
        .ftFont(textStyle: .caption1, weight: .medium)
        return label
    }
    
    func ftConfigure(tag: FTTag) {
        label.text = tag.text
        isHidden = false
    }
    
    func ftPrepareForReuse() {
        isHidden = true
    }

}
