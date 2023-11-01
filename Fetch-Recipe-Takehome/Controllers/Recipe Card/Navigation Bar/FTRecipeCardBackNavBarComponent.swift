//
//  FTRecipeCardBackNavBarComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardBackNavBarComponent: FTButton {

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
        return FTHStack()
        .ftAddArrangedSubview(
            guaranteedAlignment: .center,
            Symbol()
        )
        .ftBackgroundColor(.black.withAlphaComponent(0.5))
        .ftCapsulateCorners()
        .ftWidth(32)
        .ftHeight(32)
    }
    
    private func Symbol() -> UIView {
        return FTSymbol()
        .ftSymbol(.back, textStyle: .title2, weight: .semibold)
        .ftColor(.white)
    }

}
