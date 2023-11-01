//
//  FTRecipeImageBackgroundComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTRecipeCardImageBackgroundComponent: FTImageComponent {
    
    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftImage(UIImage(named: "default"))
        
        snp.makeConstraints { make in
            make.height.equalTo(snp.width)
        }
        
    }

}
