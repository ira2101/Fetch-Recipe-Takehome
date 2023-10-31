//
//  FTFeedHeaderFilterItemComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTFeedHeaderFilterBarItemComponent: FTToggleButton {
    
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
        .ftAddArrangedSubview(
            Label()
        )
        .ftAddArrangedSubview(
            Image()
        )
        .ftSpacing(20)
        .ftPaddingHorizontal(16)
        .ftPaddingVertical(8)
        .ftAlignment(.center)
        .ftCapsulateCorners()
        .ftBorder(width: 1.0, color: unselectedBorderColor)
        return container
    }
    
    private func Label() -> UIView {
        return FTLabel()
        .ftText("Breakfast")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .subheadline, weight: .medium)
    }
    
    private func Image() -> UIView {
        return FTHStack()
        .ftBackgroundColor(.green)
        .ftWidth(28)
        .ftHeight(28)
        .ftCapsulateCorners()
    }
    
    private func toggleButtonDidChangeState(_ isActive: Bool) {
        isActive ? onActivate() : onDeactivate()
    }
    
    private func onActivate() {
        container.ftBorder(width: 2.0, color: FTColorPalette.primary)
    }
    
    private func onDeactivate() {
        container.ftBorder(width: 1.0, color: unselectedBorderColor)
    }
    
}
