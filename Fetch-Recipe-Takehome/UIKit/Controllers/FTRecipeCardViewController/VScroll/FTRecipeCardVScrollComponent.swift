//
//  FTRecipeCardScrollComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTRecipeCardVScrollComponent: FTVScrollStack, UIScrollViewDelegate {
    
    private struct Props {
        var model: FTRecipeCardVScrollViewModel
    }
    
    private let props: Props
    
    var ftMyMulticastDelegate: FTMulticastDelegate<FTRecipeCardScrollDelegate> = .init()
    
    var overviewComponent: FTRecipeCardOverviewComponent!
        
    init(model: FTRecipeCardVScrollViewModel) {
        props = Props(model: model)
        super.init()
        setupView()
        setupDelegates()
    }
    
    private func setupDelegates() {
        ftScrollView.delegate = self
        
        ftMyMulticastDelegate.add(overviewComponent)
    }
    
    private func setupView() {
        self
        .ftAddArrangedSubview(
            Overview()
        )
        .ftAddArrangedSubview(
            Ingredients()
        )
        .ftAddArrangedSubview(
            Instructions()
        )
        .ftPaddingBottom(16)
        
        // We want to change the background color of the content. The scroll view
        // covers the entire screen.
        ftStackView.ftBackgroundColor(UIColor(hex: 0xF6F6F8))
    }
        
    private func Overview() -> UIView {
        overviewComponent = FTRecipeCardOverviewComponent(
            model: props.model.createOverviewModel()
        )
        return overviewComponent
    }
    
    private func Ingredients() -> UIView {
        return FTRecipeCardIngredientsComponent(
            model: props.model.createIngredientsModel()
        )
    }
    
    private func Instructions() -> UIView {
        return FTRecipeCardInstructionsComponent(
            model: props.model.createInstructionsModel()
        )
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        ftMyMulticastDelegate.invoke { delegate in
            delegate.ftRecipeCardDidScroll(scrollView)
        }
    }
    
}
