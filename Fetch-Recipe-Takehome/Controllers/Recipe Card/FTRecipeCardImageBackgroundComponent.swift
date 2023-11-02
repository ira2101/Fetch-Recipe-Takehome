//
//  FTRecipeImageBackgroundComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardImageBackgroundComponent: FTImageView, FTRecipeCardScrollDelegate {
    
    private var heightConstraint: NSLayoutConstraint!
    
    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftPlaceholder(
            FTHStack()
            .ftBackgroundColor(FTColorPalette.placeholder)
        )
        .ftShowPlaceholder(true)
        .ftContentMode(.scaleAspectFill)
        .ftClipsToBounds(true)
        
        heightConstraint = heightAnchor.constraint(equalTo: widthAnchor)
        heightConstraint.isActive = true
    }
    
    func ftRecipeCardDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y

        // Now the offset is zero-based
        let adjustedYOffset = yOffset + scrollView.contentInset.top

        if adjustedYOffset < 0 {
            heightConstraint.constant = -adjustedYOffset
        } else {
            heightConstraint.constant = 0
        }
    }

}
