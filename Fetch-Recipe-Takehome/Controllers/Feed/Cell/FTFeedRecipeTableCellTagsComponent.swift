//
//  FTRecipeTableCellTagsComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTFeedRecipeTableCellTagsComponent: FTHScrollStack {
    
    private let maxNumberOfTags = 5
    
    private var tagItemComponents: [FTFeedRecipeTableCellTagItemComponent] = []

    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        // I decided that a recipe can show no more than five tags
        for _ in 0..<maxNumberOfTags {
            tagItemComponents.append(FTFeedRecipeTableCellTagItemComponent())
        }
        
        tagItemComponents.forEach { item in
            self.ftAddArrangedSubview(item)
        }
        
        self
        .ftSpacing(4)
        .ftAlwaysBounceHorizontal(false)
        .ftshowsHorizontalScrollIndicator(false)
    }
    
    func ftConfigure(model: FTFeedRecipeTableCellTagsModel) {
        if model.tags.count == 0 {
            isHidden = true
        }
        
        // we use min in case tags.count < tagItemComponents.count
        for i in 0..<min(tagItemComponents.count, model.tags.count) {
            tagItemComponents[i].ftConfigure(tag: model.tags[i])
        }
    }
    
    func ftPrepareForReuse() {
        isHidden = false
        
        // Clear the tags
        tagItemComponents.forEach { item in
            item.ftPrepareForReuse()
        }
        
        // In case the scroll view was scrolled
        ftScrollView.contentOffset = .zero
    }
    
}
