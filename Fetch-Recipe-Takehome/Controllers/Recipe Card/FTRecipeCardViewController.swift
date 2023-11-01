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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if isFirstPass {
            scrollComponent.ftScrollView.contentInset.top = backgroundComponent.frame.height

            isFirstPass = false
        }
    }

}
