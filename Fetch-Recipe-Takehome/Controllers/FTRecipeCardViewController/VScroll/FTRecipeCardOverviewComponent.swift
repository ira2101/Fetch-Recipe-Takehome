//
//  FTRecipeCardTitleComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardOverviewComponent: FTVStack, FTRecipeCardScrollDelegate {
    
    private struct Props {
        var model: FTRecipeCardOverviewModel
    }
    
    private let props: Props
    
    var ftMyMulticastDelegate: FTMulticastDelegate<FTRecipeCardTitleDelegate> = .init()
    
    private var titleLabel: FTLabel!
    
    init(model: FTRecipeCardOverviewModel) {
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
            guaranteedAlignment: .leading,
            Stats()
        )
        .ftSpacing(16)
        .ftPaddingHorizontal(16)
        .ftPaddingVertical(24)
        .ftBackgroundColor(.systemBackground)
    }
    
    private func TitleLabel() -> UIView {
        titleLabel =
        FTLabel()
        .ftText(props.model.recipe.mealName)
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .title1, weight: .semibold)
        .ftNumberOfLines(0)
        return titleLabel
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
        .ftSpacing(8)
        .ftAlignment(.center)
    }
    
    private func IngredientsLabel() -> UIView {
        return FTLabel()
        .ftAttributedText(
            AttributedString(
                count: props.model.recipe.ingredients.count,
                thing: "Ingredient"
            )
        )
    }
    
    private func StepsLabel() -> UIView {
        return FTLabel()
        .ftAttributedText(
            AttributedString(
                count: props.model.recipe.instructions.count,
                thing: "Step"
            )
        )
    }
    
    private func AttributedString(count: Int, thing: String) -> NSMutableAttributedString {
        return FTAttributedStringBuilder()
        .ftAppend(
            FTAttributedString()
            .ftText(count.formatted())
            .ftTextColor(FTColorPalette.labelPrimary)
            .ftFont(textStyle: .body, weight: .semibold)
            .ftBuild()
        )
        .ftAppend(
            FTAttributedString()
            .ftText(" ")
            .ftTextColor(FTColorPalette.labelPrimary)
            .ftFont(textStyle: .body, weight: .semibold)
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
        // Sometimes this function is called before this component has laid out
        // its subviews
        if frame == .zero {
            return
        }
        
        // Get the position of the titleLabel on screen
        let screenFrame = titleLabel.convert(titleLabel.bounds, to: .none)
        
        // Get the top inset to account for the space that the navigation bar takes up
        let screenTopInset = parentViewController?.view.safeAreaInsets.top ?? 0
        
        // Get the y position of the titleLabel
        let yPosition = screenFrame.minY - screenTopInset
                        
        // Calculate the percent offscreen that titleLabel is, so that the delegates
        // can adjust their alpha values by this percentage
        let percent = abs(yPosition) / screenFrame.height
        
        // Somewhere in this interval [0, 1]
        let adjustedPercent = min(max(0, percent), 1.0)
        
        // if yPosition > 0 then adjustedPercent is invalid. Percentage will always
        // equal zero when yPosition > 0.
        ftMyMulticastDelegate.invoke { delegate in
            delegate.ftRecipeCardTitlePercentOffscreen(
                percent: yPosition < 0 ? adjustedPercent : 0.0
            )
        }
    }

}
