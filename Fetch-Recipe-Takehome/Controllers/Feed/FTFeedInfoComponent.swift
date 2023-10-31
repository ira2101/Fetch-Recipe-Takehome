//
//  FTFeedInfoComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTFeedInfoComponent: FTHStack {

    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftAddArrangedSubview(
//            guaranteedAlignment: .leading,
            Label()
        )
        .ftPaddingHorizontal(16)
    }
    
    private func Label() -> UIView {
        return FTLabel()
        .ftAttributedText(
            FTAttributedStringBuilder()
            .ftAppend(
                FTAttributedString()
                .ftText("112 ")
                .ftTextColor(FTColorPalette.labelPrimary)
                .ftFont(textStyle: .caption1, weight: .bold)
                .ftBuild()
            )
            .ftAppend(
                FTAttributedString()
                .ftText("results")
                .ftTextColor(FTColorPalette.labelPrimary)
                .ftFont(textStyle: .caption1, weight: .medium)
                .ftBuild()
            )
            .ftBuild()
        )
    }

}
