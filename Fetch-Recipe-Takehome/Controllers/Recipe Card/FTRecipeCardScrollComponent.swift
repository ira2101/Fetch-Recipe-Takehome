//
//  FTRecipeCardScrollComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTRecipeCardScrollComponent: FTVScrollStack, UIScrollViewDelegate {
    
    var ftMyMulticastDelegate: FTMulticastDelegate<FTRecipeCardScrollDelegate> = .init()
    
    private var titleComponent: FTRecipeCardTitleComponent!
        
    override init() {
        super.init()
        setupView()
        setupDelegates()
    }
    
    private func setupDelegates() {
        ftScrollView.delegate = self
        
        ftMyMulticastDelegate.add(titleComponent)
    }
    
    private func setupView() {
        self
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
        titleComponent = FTRecipeCardTitleComponent()
        return titleComponent
    }
    
    private func Ingredients() -> UIView {
        return FTRecipeCardIngredientComponent()
    }
    
    private func Steps() -> UIView {
        return FTRecipeCardStepComponent()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        ftMyMulticastDelegate.invoke { delegate in
            delegate.ftRecipeCardDidScroll(scrollView)
        }
    }
    
}
