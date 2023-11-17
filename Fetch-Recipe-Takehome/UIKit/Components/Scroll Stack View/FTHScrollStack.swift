//
//  FTHScrollStack.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTHScrollStack: FTScrollStackView {
    
    override init() {
        super.init()
        
        ftStackView.axis = .horizontal

        ftStackView.snp.makeConstraints { make in
            make.height.equalTo(ftScrollView.snp.height)
        }
    }
    
}
