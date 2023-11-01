//
//  FTRecipeCardViewController.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTRecipeCardViewController: UIViewController {
    
    private var backgroundComponent: FTRecipeCardImageBackgroundComponent!
    
    private var scrollComponent: FTRecipeCardScrollComponent!
    
    // for layout passes
    private var isFirstPass = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        setupDelegates()
    }
    
    private func setupDelegates() {
        scrollComponent.ftMyMulticastDelegate.add(backgroundComponent)
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground

        backgroundComponent = FTRecipeCardImageBackgroundComponent()
        
        view.addSubview(backgroundComponent)
        
        backgroundComponent.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
                
        scrollComponent = FTRecipeCardScrollComponent()
                
        view.addSubview(scrollComponent)
        
        scrollComponent.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem(customView: BackButton())
        
        navigationItem.leftBarButtonItem = backButton
        
        navigationItem.title = "Title"
        
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
    
    private func BackButton() -> UIView {
        return FTRecipeCardBackNavBarComponent()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if isFirstPass {
            scrollComponent.ftScrollView.contentInset.top = backgroundComponent.frame.height

            isFirstPass = false
        }
    }
    
}
