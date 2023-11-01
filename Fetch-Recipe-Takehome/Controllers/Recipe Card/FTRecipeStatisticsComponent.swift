//
//  FTRecipeStatisticsComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTRecipeStatisticsComponent: FTHStack {
    
    private var separator: FTHStack!
    
    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftAddArrangedSubview(
            IngredientsLabel()
        )
        .ftAddArrangedSubview(
            Separator()
        )
        .ftAddArrangedSubview(
            StepsLabel()
        )
        .ftSpacing(20)
        .ftPaddingHorizontal(24)
        .ftPaddingVertical(12)
        .ftBackgroundColor(.systemBackground)
        .ftCornerRadius(8)
        .ftShadow(
            color: .black.withAlphaComponent(0.08),
            blur: 12,
            offset: CGSize(width: 0, height: 2)
        )
        
        separator.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.75)
        }
    }
    
    private func IngredientsLabel() -> UIView {
        return FTLabel()
        .ftAttributedText(
            AttributedString(count: 0, thing: "Ingredient")
        )
        .ftNumberOfLines(2)
        .ftTextAlignment(.center)
    }
    
    private func StepsLabel() -> UIView {
        return FTLabel()
        .ftAttributedText(
            AttributedString(count: 0, thing: "Step")
        )
        .ftNumberOfLines(2)
        .ftTextAlignment(.center)
    }
    
    private func Separator() -> UIView {
        separator =
        FTHStack()
        .ftBackgroundColor(FTColorPalette.separator)
        .ftWidth(1.0)
        return separator
    }
    
    private func AttributedString(count: Int, thing: String) -> NSMutableAttributedString {
        return FTAttributedStringBuilder()
        .ftAppend(
            FTAttributedString()
            .ftText(count.formatted())
            .ftTextColor(FTColorPalette.labelPrimary)
            .ftFont(textStyle: .title2, weight: .bold)
            .ftBuild()
        )
        .ftAppend(
            FTAttributedString()
            .ftText("\n")
            .ftTextColor(FTColorPalette.labelPrimary)
            .ftFont(textStyle: .title2, weight: .bold)
            .ftBuild()
        )
        .ftAppend(
            FTAttributedString()
            .ftText(FTFormatter.pluralize(thing, count: count))
            .ftTextColor(FTColorPalette.labelSecondary)
            .ftFont(textStyle: .title2, weight: .regular)
            .ftBuild()
        )
        .ftBuild()
    }

}
