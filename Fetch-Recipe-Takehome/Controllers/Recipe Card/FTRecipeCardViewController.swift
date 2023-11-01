//
//  FTRecipeCardViewController.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTRecipeCardViewController: UIViewController, FTRecipeCardTitleDelegate {
    
    private var backgroundComponent: FTRecipeCardImageBackgroundComponent!
    
    private var scrollComponent: FTRecipeCardScrollComponent!
    
    private var navBackgroud: FTHStack!
    
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
        
        scrollComponent.titleComponent.ftMyMulticastDelegate.add(self)
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
        
        navigationItem.titleView =
        FTLabel()
        .ftText("Title")
        .ftTextColor(FTColorPalette.labelPrimary)
        .ftFont(textStyle: .body, weight: .semibold)
        .ftIsHidden(true) // alpha does not work in this case
        
        let navBackground =
        FTHStack()
        .ftBackgroundColor(.systemBackground)
        .ftAlpha(0) // Initially hide
        
        view.addSubview(navBackground)
        
        navBackground.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        self.navBackgroud = navBackground
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
    
    func ftRecipeCardTitlePercentOffscreen(percent: CGFloat) {
        navigationItem.titleView?.alpha = percent
        navigationItem.titleView?.isHidden = percent == 0.0
        navBackgroud.alpha = percent
    }
    
}
