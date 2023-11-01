//
//  FTRecipeCardScrollComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTRecipeCardScrollComponent: FTVScrollStack, UIScrollViewDelegate {
    
    weak var ftMyDelegate: FTRecipeCardScrollDelegate?
    
    private var statisticsComponent: FTRecipeCardStatisticsComponent!
    
    override init() {
        super.init()
        setupView()
        
        ftScrollView.delegate = self
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
            // of the statistics component. It would be UIColor(hex: 0xF6F6F8)
            // if we used padding
            FTHStack()
            .ftHeight(statisticsComponent.frame.height / 2)
            .ftBackgroundColor(.systemBackground)
        )
        .ftAddArrangedSubview(
            Title()
        )
        .ftAddArrangedSubview(
            Ingredients()
        )
        .ftAddArrangedSubview(
            Steps()
        )
        .ftPaddingBottom(16)
        
        // We want to change the background color of the content. The scroll view
        // covers the entire screen.
        ftStackView.ftBackgroundColor(UIColor(hex: 0xF6F6F8))
    }
        
    private func Title() -> UIView {
        return FTRecipeCardTitleComponent()
    }
    
    private func Ingredients() -> UIView {
        return FTRecipeCardIngredientComponent()
    }
    
    private func Steps() -> UIView {
        return FTRecipeCardStepComponent()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        ftMyDelegate?.ftRecipeCardDidScroll(scrollView)
    }
    
}
