//
//  FTRecipeCardScrollComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTRecipeCardScrollComponent: FTVScrollStack {
    
    private var statisticsComponent: FTRecipeCardStatisticsComponent!
    
    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        statisticsComponent = FTRecipeCardStatisticsComponent()
        
        ftScrollView.addSubview(statisticsComponent)
        
        statisticsComponent.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(ftScrollView.snp.top)
        }
        
        statisticsComponent.setNeedsLayout()
        statisticsComponent.layoutIfNeeded()
        
        self
        .ftAddArrangedSubview(
            // This over padding because we want a white background on half
            // of the statistics component. It would be clear if we used padding
            FTHStack()
            .ftHeight(statisticsComponent.frame.height / 2)
            .ftBackgroundColor(.systemBackground)
        )
        .ftAddArrangedSubview(
            Title()
        )
        .ftAddArrangedSubview(
            Information()
        )
        .ftPaddingBottom(16)
    }
        
    private func Title() -> UIView {
        return FTRecipeCardTitleComponent()
    }
    
    private func Information() -> UIView {
        return FTVStack()
        .ftAddArrangedSubview(
            Ingredients()
        )
        .ftAddArrangedSubview(
            Steps()
        )
        .ftBackgroundColor(UIColor(hex: 0xF6F6F8))
    }
    
    private func Ingredients() -> UIView {
        return FTRecipeCardIngredientComponent()
    }
    
    private func Steps() -> UIView {
        return FTRecipeCardStepComponent()
    }
    
}
