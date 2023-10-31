//
//  FTVScrollStack.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTVScrollStack: FTScrollStackView {
    
    override init() {
        super.init()
        
        ftStackView.axis = .vertical

        ftStackView.snp.makeConstraints { make in
            make.width.equalTo(ftScrollView.snp.width)
        }
    }
    
}
