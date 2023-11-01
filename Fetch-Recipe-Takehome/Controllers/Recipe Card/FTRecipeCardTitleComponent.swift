//
//  FTRecipeCardTitleComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardTitleComponent: FTVStack, FTRecipeCardScrollDelegate {
    
    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftAddArrangedSubview(
            TitleLabel()
        )
        .ftAddArrangedSubview(
            guaranteedAlignment: .leading,
            Stats()
        )
        .ftSpacing(8)
        .ftPaddingHorizontal(16)
        .ftPaddingVertical(24)
        .ftBackgroundColor(.systemBackground)
    }
    
    private func TitleLabel() -> UIView {
        return FTLabel()
        .ftText("Title")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .title2, weight: .semibold)
        .ftNumberOfLines(0)
    }
    
    private func Stats() -> UIView {
        return FTHStack()
        .ftAddArrangedSubview(
            IngredientsLabel()
        )
        .ftAddArrangedSubview(
            FTLabel()
            .ftText("\u{2022}")
            .ftFont(textStyle: .caption2, weight: .regular)
            .ftTextColor(FTColorPalette.labelSecondary)
        )
        .ftAddArrangedSubview(
            StepsLabel()
        )
        .ftSpacing(12)
        .ftAlignment(.center)
    }
    
    private func IngredientsLabel() -> UIView {
        return FTLabel()
        .ftAttributedText(
            AttributedString(count: 0, thing: "Ingredient")
        )
    }
    
    private func StepsLabel() -> UIView {
        return FTLabel()
        .ftAttributedText(
            AttributedString(count: 0, thing: "Step")
        )
    }
    
    private func AttributedString(count: Int, thing: String) -> NSMutableAttributedString {
        return FTAttributedStringBuilder()
        .ftAppend(
            FTAttributedString()
            .ftText(count.formatted())
            .ftTextColor(FTColorPalette.labelPrimary)
            .ftFont(textStyle: .title3, weight: .bold)
            .ftBuild()
        )
        .ftAppend(
            FTAttributedString()
            .ftText(" ")
            .ftTextColor(FTColorPalette.labelPrimary)
            .ftFont(textStyle: .title3, weight: .bold)
            .ftBuild()
        )
        .ftAppend(
            FTAttributedString()
            .ftText(FTFormatter.pluralize(thing, count: count))
            .ftTextColor(FTColorPalette.labelSecondary)
            .ftFont(textStyle: .body, weight: .regular)
            .ftBuild()
        )
        .ftBuild()
    }
    
    func ftRecipeCardDidScroll(_ scrollView: UIScrollView) {
        
    }

}
