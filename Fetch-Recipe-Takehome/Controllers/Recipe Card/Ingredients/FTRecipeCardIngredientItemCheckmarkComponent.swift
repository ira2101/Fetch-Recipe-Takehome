//
//  FTRecipeCardIngredientItemCheckmarkComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardIngredientItemCheckmarkComponent: FTToggleButton {
    
    private let unselectedBorderColor = UIColor(hex: 0xE9E9E9)
    
    private var container: FTHStack!

    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftComponent(
            Container()
        )
        .ftToggleButtonDidChangeState { [weak self] isActive in
            guard let self = self else { return }
            
            self.toggleButtonDidChangeState(isActive)
        }
    }
    
    private func Container() -> UIView {
        container =
        FTHStack()
        .ftWidth(28)
        .ftHeight(28)
        .ftBorder(width: 1, color: unselectedBorderColor)
        .ftBackgroundColor(.clear)
        return container
    }
    
    private func toggleButtonDidChangeState(_ isActive: Bool) {
        isActive ? onActivate() : onDeactivate()
    }
    
    private func onActivate() {
        container.ftBorder(width: 1, color: .clear)
        container.ftBackgroundColor(UIColor(hex: 0xFCF3DB))
    }
    
    private func onDeactivate() {
        container.ftBorder(width: 1, color: unselectedBorderColor)
        container.ftBackgroundColor(.clear)
    }

}
