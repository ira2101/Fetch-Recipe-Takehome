//
//  FTFeedHeaderComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTFeedHeaderFilterBarComponent: FTHScrollStack {

    private var items: [FTFeedHeaderFilterBarItemComponent] = []
    
    private var model: FTFeedHeaderFilterBarModel
    
    override init() {
        model = FTFeedHeaderFilterBarModel()
        
        super.init()
        
        setupView()
        
        model.readCategories { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let categories):
                self.successfullyReadCategories(categories: categories)
            case .failure:
                // There is nothing we want to do if we can't fetch results. We will show
                // in the tableView if we are unable to fetch any results.
                break
            }
        }
    }
        
    private func setupView() {
        self
        .ftSpacing(8)
        .ftPaddingHorizontal(16)
        .ftAlwaysBounceHorizontal(true)
        .ftshowsHorizontalScrollIndicator(false)
        .ftBackgroundColor(.systemBackground)
    }
            
    private func onItemPress(_ selected: FTToggleButton) {
        for item in items {
            item.ftSetActive(item == selected)
        }
        
        ftScrollRectToVisible(selected.frame, animated: true)
    }
    
    private func successfullyReadCategories(categories: [FTCategory]) {
        items = categories.map {
            FTFeedHeaderFilterBarItemComponent(
                model: model.createItemModel(for: $0),
                onItemPress: { [weak self] toggleButton in
                    guard let self = self else { return }
                    self.onItemPress(toggleButton)
                }
            )
        }
        
        items.forEach { item in
            ftAddArrangedSubview(item)
        }
        
        items.first?.ftSetActive(true)
    }

}
