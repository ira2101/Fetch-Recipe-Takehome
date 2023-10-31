//
//  FTFeedHeaderComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTFeedHeaderFilterBarComponent: FTHScrollStack {

    private var items: [FTFeedHeaderFilterBarItemComponent] = []
    
    override init() {
        super.init()
        setupView()
    }
        
    private func setupView() {
        self
        .ftSpacing(8)
        .ftPaddingHorizontal(16)
        .ftAlwaysBounceHorizontal(true)
        .ftshowsHorizontalScrollIndicator(false)
        .ftBackgroundColor(.systemBackground)
        
        items = [
            FTFeedHeaderFilterBarItemComponent(
                onItemPress: { [weak self] toggleButton in
                    guard let self = self else { return }
                    self.onItemPress(toggleButton)
            }),
            FTFeedHeaderFilterBarItemComponent(
                onItemPress: { [weak self] toggleButton in
                    guard let self = self else { return }
                    self.onItemPress(toggleButton)
            }),
            FTFeedHeaderFilterBarItemComponent(
                onItemPress: { [weak self] toggleButton in
                    guard let self = self else { return }
                    self.onItemPress(toggleButton)
            }),
            FTFeedHeaderFilterBarItemComponent(
                onItemPress: { [weak self] toggleButton in
                    guard let self = self else { return }
                    self.onItemPress(toggleButton)
            })
        ]
                        
        items.forEach { item in
            ftAddArrangedSubview(item)
        }
                
        items.first?.ftSetActive(true)
    }
        
    private func onItemPress(_ selected: FTToggleButton) {
        for item in items {
            item.ftSetActive(item == selected)
        }
        
        ftScrollRectToVisible(selected.frame, animated: true)
    }

}
