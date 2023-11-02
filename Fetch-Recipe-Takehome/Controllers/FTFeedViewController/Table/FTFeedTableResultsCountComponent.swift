//
//  FTFeedInfoComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTFeedTableResultsCountComponent: FTHStack {
    
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
        .ftPaddingHorizontal(16)
    }
    
    private func Label() -> UIView {
        label =
        FTLabel()
        .ftAttributedText(
            AttributedString(count: 0, thing: "result")
        )
        return label
    }
    
    private func AttributedString(count: Int, thing: String) -> NSMutableAttributedString {
        return FTAttributedStringBuilder()
        .ftAppend(
            FTAttributedString()
            .ftText("\(count.formatted())")
            .ftTextColor(FTColorPalette.labelPrimary)
            .ftFont(textStyle: .footnote, weight: .bold)
            .ftBuild()
        )
        .ftAppend(
            FTAttributedString()
            .ftText(" ")
            .ftTextColor(FTColorPalette.labelPrimary)
            .ftFont(textStyle: .footnote, weight: .bold)
            .ftBuild()
        )
        .ftAppend(
            FTAttributedString()
            .ftText(FTFormatter.pluralize(thing, count: count))
            .ftTextColor(FTColorPalette.labelPrimary)
            .ftFont(textStyle: .footnote, weight: .medium)
            .ftBuild()
        )
        .ftBuild()
    }
    
    func ftConfigure(count: Int) {
        label.ftAttributedText(
            AttributedString(count: count, thing: "result")
        )
    }

}
