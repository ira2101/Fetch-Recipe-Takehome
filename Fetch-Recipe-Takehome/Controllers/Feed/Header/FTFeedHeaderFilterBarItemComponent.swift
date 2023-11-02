//
//  FTFeedHeaderFilterItemComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTFeedHeaderFilterBarItemComponent: FTToggleButton {
    
    private struct Props {
        var model: FTFeedHeaderFilterBarItemModel
        var onItemPress: (FTToggleButton) -> Void
    }
    
    private var props: Props
    
    private let unselectedBorderColor = UIColor(hex: 0xE9E9E9)
    
    private var container: FTHStack!
    
    private var imageView: FTImageView!
        
    init(model: FTFeedHeaderFilterBarItemModel, onItemPress: @escaping (FTToggleButton) -> Void) {
        props = Props(model: model, onItemPress: onItemPress)
        
        super.init()
        
        setupView()
        
        props.model.readThumbnailImage { [weak self] image in
            guard let self = self else {
                return
            }
            
            self.imageView.ftImage(image)
        }
    }

    private func setupView() {
        self
        .ftComponent(
            Container()
        )
        .ftShouldToggleManually(true)
        .ftToggleButtonDidChangeState { [weak self] isActive in
            guard let self = self else { return }
            
            self.toggleButtonDidChangeState(isActive)
        }
        .ftOnPress { [weak self] in
            guard let self = self else { return }
            
            props.onItemPress(self)
        }
    }
    
    private func Container() -> UIView {
        container =
        FTHStack()
        .ftAddArrangedSubview(
            Label()
        )
        .ftAddArrangedSubview(
            ImageContainer()
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
        .ftText(props.model.category.type)
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .subheadline, weight: .medium)
    }
    
    private func ImageContainer() -> UIView {
        return FTHStack()
        .ftAddArrangedSubview(
            ImageView()
        )
        .ftWidth(28)
        .ftHeight(28)
        .ftCapsulateCorners()
        .ftClipsToBounds(true)
    }
    
    private func ImageView() -> UIView {
        imageView =
        FTImageView()
        .ftPlaceholder(
            FTHStack()
            .ftBackgroundColor(FTColorPalette.placeholder)
        )
        .ftShowPlaceholder(true)
        .ftContentMode(.scaleAspectFill)
        return imageView
    }
    
    private func toggleButtonDidChangeState(_ isActive: Bool) {
        isActive ? onActivate() : onDeactivate()
    }
    
    private func onActivate() {
        container.ftBorder(width: 2.0, color: FTColorPalette.primary)
        container.ftBackgroundColor(UIColor(hex: 0xFCF3DB))
    }
    
    private func onDeactivate() {
        container.ftBorder(width: 1.0, color: unselectedBorderColor)
        container.ftBackgroundColor(.clear)
    }
    
}
