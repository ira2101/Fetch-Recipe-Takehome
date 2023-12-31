//
//  FTFeedHeaderComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTFeedHeaderFilterBarComponent: FTHScrollStack {
    
    private var state: String? = .none {
        didSet {
            guard let state = state else {
                // Let the table know that an error has occurred!
                ftMyDelegate?.ftFeedHeaderFilterBarDidChangeFilterTo(filter: nil)
                return
            }
            
            guard let selectedItem = items[state] else {
                return
            }
                        
            selectedItem.ftSetActive(true)
            
            ftScrollRectToVisible(selectedItem.frame, animated: true)
            
            ftMyDelegate?.ftFeedHeaderFilterBarDidChangeFilterTo(filter: state)
        }
    }
    
    weak var ftMyDelegate: FTFeedHeaderFilterBarDelegate?

    private var items: [String : FTFeedHeaderFilterBarItemComponent] = [:]
    
    private var model: FTFeedHeaderFilterBarViewModel
    
    override init() {
        model = FTFeedHeaderFilterBarViewModel()
        
        super.init()
        
        setupView()
        
        model.readCategories { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let categories):
                self.successfullyReadCategories(categories: categories)
            case .failure:
                self.state = nil
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
            
    private func onItemPress(_ selected: FTToggleButton, _ filter: String) {
        for item in items {
            item.value.ftSetActive(false)
        }
        
        state = filter
    }
    
    private func successfullyReadCategories(categories: [FTCategory]) {
        items = Dictionary(uniqueKeysWithValues: categories.map {
            (
                $0.type,
                FTFeedHeaderFilterBarItemComponent(
                    model: model.createItemModel(for: $0),
                    onItemPress: { [weak self] toggleButton, filter in
                        guard let self = self else { return }
                        self.onItemPress(toggleButton, filter)
                    }
                )
            )
        })
        
        categories.forEach {
            if let item = items[$0.type] {
                ftAddArrangedSubview(item)
            }
        }
        
        state = categories.first?.type
    }

}
