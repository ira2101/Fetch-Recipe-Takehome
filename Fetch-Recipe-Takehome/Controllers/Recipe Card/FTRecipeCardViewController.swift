//
//  FTRecipeCardViewController.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTRecipeCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        let background = FTRecipeCardImageBackgroundComponent()
        
        view.addSubview(background)
        
        background.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        let statisticsComponent = FTRecipeCardStatisticsComponent()
        
        view.addSubview(statisticsComponent)
        
        statisticsComponent.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(background.snp.bottom)
        }
        
        let scrollComponent = FTRecipeCardScrollComponent()
        
        view.addSubview(scrollComponent)
        
        scrollComponent.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollComponent.ftScrollView.contentInset.top = 400
    }
    

    

}
