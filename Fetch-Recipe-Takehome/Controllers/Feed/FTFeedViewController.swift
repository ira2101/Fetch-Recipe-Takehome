//
//  FTFeedViewController.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTFeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(hex: 0xFAFAFA)
        
        let filterBar = FTFeedHeaderComponent()
        
        view.addSubview(filterBar)
        
        filterBar.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        let table = FTFeedRecipeTableComponent()
        
        view.addSubview(table)
        
        table.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(filterBar.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        let titleItem = UIBarButtonItem(customView: NavigationTitleLabel())
        navigationItem.leftBarButtonItem = titleItem
    }
    
    private func NavigationTitleLabel() -> UIView {
        return FTLabel()
        .ftText("Discover Recipes")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .title2, weight: .semibold)
    }

}
