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
            Title()
        )
        .ftAddArrangedSubview(
            Information()
        )
        .ftPaddingTop(statisticsComponent.frame.height / 2) // we don't want the stat component to cover anything
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
