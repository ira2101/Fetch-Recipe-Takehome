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

        let background = FTRecipeImageBackgroundComponent()
        
        view.addSubview(background)
        
        background.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        let statisticsComponent = FTRecipeStatisticsComponent()
        
        view.addSubview(statisticsComponent)
        
        statisticsComponent.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(background.snp.bottom)
        }
        
        let titleComponent = FTRecipeCardTitleComponent()
        
        view.addSubview(titleComponent)
        
        titleComponent.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(statisticsComponent.snp.bottom)
        }
        
        // so the shadow of the statisticsComponent comes through
        view.sendSubviewToBack(titleComponent)
        
    }
    

    

}
