//
//  FTRecipeImageBackgroundComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTRecipeImageBackgroundComponent: FTHStack {
    
    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        self
        .ftBackgroundColor(.systemCyan)
        
        snp.makeConstraints { make in
            make.height.equalTo(snp.width)
        }
        
    }

}
