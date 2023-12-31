//
//  FTFeedViewController.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTFeedViewController: UIViewController {
    
    private var headerComponent: FTFeedHeaderComponent!
    
    private var tableComponent: FTFeedRecipeTableComponent!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupDelegates()
    }
    
    private func setupDelegates() {
        headerComponent.filterBarComponent.ftMyDelegate = tableComponent
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(hex: 0xF8F8F8)
        
        headerComponent = FTFeedHeaderComponent()
        
        view.addSubview(headerComponent)
        
        headerComponent.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
                
        tableComponent = FTFeedRecipeTableComponent()
        
        view.addSubview(tableComponent)
        
        tableComponent.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(headerComponent.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        let titleItem = UIBarButtonItem(customView: NavigationTitleLabel())
        navigationItem.leftBarButtonItem = titleItem
        
        let navBackground =
        FTHStack()
        .ftBackgroundColor(.systemBackground)
        
        view.addSubview(navBackground)
        
        navBackground.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func NavigationTitleLabel() -> UIView {
        return FTLabel()
        .ftText("Discover Recipes")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .title2, weight: .semibold)
    }

}
