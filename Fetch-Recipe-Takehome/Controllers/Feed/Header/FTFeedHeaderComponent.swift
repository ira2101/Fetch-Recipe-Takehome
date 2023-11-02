//
//  FTFeedHeaderComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTFeedHeaderComponent: FTHStack {
    
    var filterBarComponent: FTFeedHeaderFilterBarComponent!

    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftAddArrangedSubview(
            FilterBar()
        )
        .ftPaddingVertical(8)
        .ftBackgroundColor(.systemBackground)
    }
    
    private func FilterBar() -> UIView {
        filterBarComponent = FTFeedHeaderFilterBarComponent()
        return filterBarComponent
    }

}
