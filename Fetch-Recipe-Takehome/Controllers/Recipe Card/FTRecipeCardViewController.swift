//
//  FTRecipeCardViewController.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTRecipeCardViewController: UIViewController, FTRecipeCardTitleDelegate {
    
    private struct Props {
        var model: FTRecipeCardViewControllerModel
    }
    
    private let props: Props
    
    private var backgroundImageComponent: FTRecipeCardBackgroundImageComponent!
    
    private var vScrollComponent: FTRecipeCardVScrollComponent!
    
    private var backNavBarComponent: FTRecipeCardBackNavBarComponent!
    
    private var navBackgroud: FTHStack!
    
    // for layout passes
    private var isFirstPass = true
    
    init(model: FTRecipeCardViewControllerModel) {
        props = Props(model: model)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        setupDelegates()
    }
    
    private func setupDelegates() {
        vScrollComponent.ftMyMulticastDelegate.add(backgroundImageComponent)
        
        vScrollComponent.overviewComponent.ftMyMulticastDelegate.add(self)
        vScrollComponent.overviewComponent.ftMyMulticastDelegate.add(backNavBarComponent)
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground

        backgroundImageComponent = FTRecipeCardBackgroundImageComponent(
            model: props.model.createBackgroundImageModel()
        )
        
        view.addSubview(backgroundImageComponent)
        
        backgroundImageComponent.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
                
        vScrollComponent = FTRecipeCardVScrollComponent(
            model: props.model.createVScrollModel()
        )
                
        view.addSubview(vScrollComponent)
        
        vScrollComponent.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem(customView: BackButton())
        
        navigationItem.leftBarButtonItem = backButton
        
        navigationItem.titleView =
        FTLabel()
        .ftText(props.model.recipe.mealName)
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
        backNavBarComponent = FTRecipeCardBackNavBarComponent()
        return backNavBarComponent
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if isFirstPass {
            vScrollComponent.ftScrollView.contentInset.top = backgroundImageComponent.frame.height

            isFirstPass = false
        }
    }
    
    func ftRecipeCardTitlePercentOffscreen(percent: CGFloat) {
        navigationItem.titleView?.alpha = percent
        navigationItem.titleView?.isHidden = percent == 0.0
        navBackgroud.alpha = percent
    }
    
}
