//
//  FTRecipeCardBackNavBarComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardBackNavBarComponent: FTButton, FTRecipeCardTitleDelegate {
    
    private let backgroundAlpha = 0.5
    
    private var container: FTHStack!
    
    private var symbol: FTSymbol!

    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftComponent(
            Container()
        )
        .ftOnPress { [weak self] in
            guard let self = self else { return }
            
            self.parentViewController?.navigationController?.popViewController(
                animated: true
            )
        }
    }
    
    private func Container() -> UIView {
        container =
        FTHStack()
        .ftAddArrangedSubview(
            guaranteedAlignment: .center,
            Symbol()
        )
        .ftBackgroundColor(.black.withAlphaComponent(backgroundAlpha))
        .ftCapsulateCorners()
        .ftWidth(32)
        .ftHeight(32)
        return container
    }
    
    private func Symbol() -> UIView {
        symbol =
        FTSymbol()
        .ftSymbol(.back, textStyle: .title2, weight: .semibold)
        .ftColor(.white)
        return symbol
    }
    
    func ftRecipeCardTitlePercentOffscreen(percent: CGFloat) {
        symbol.ftColor(
            percent == 1.0
            ? FTColorPalette.labelPrimary
            : .white
        )
                
        container.ftBackgroundColor(
            .black.withAlphaComponent(backgroundAlpha * (1.0 - percent))
        )
    }

}
