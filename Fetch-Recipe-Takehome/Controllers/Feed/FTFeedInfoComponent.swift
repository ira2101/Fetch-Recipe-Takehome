//
//  FTFeedInfoComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTFeedInfoComponent: FTHStack {

    override init() {
        super.init()
        setupView()
    }
    
    private func setupView() {
        
    }
    
    private func Label() -> UIView {
        return FTLabel()
        .ftText("1")
    }

}
