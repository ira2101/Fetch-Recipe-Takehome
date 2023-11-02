//
//  FTRecipeImageBackgroundComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTRecipeCardBackgroundImageComponent: FTImageView, FTRecipeCardScrollDelegate {
    
    private struct Props {
        var model: FTRecipeCardBackgroundImageModel
    }
    
    private let props: Props
    
    private var heightConstraint: NSLayoutConstraint!
    
    init(model: FTRecipeCardBackgroundImageModel) {
        props = Props(model: model)
        
        super.init()
        
        setupView()
        
        props.model.readThumbnailImage { [weak self] image in
            guard let self = self else { return }
            
            self.ftImage(image)
        }
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
