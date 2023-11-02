//
//  FTFeedRecipeTableMessageComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 11/2/23.
//

import UIKit

class FTFeedRecipeTableMessageComponent: FTLabel {

    override init() {
        super.init()
        setupView()
    }

    private func setupView() {
        self
        .ftText("")
        .ftTextColor(FTColorPalette.labelSecondary)
        .ftTextAlignment(.center)
        .ftFont(textStyle: .body, weight: .regular)
        .ftIsHidden(true)
    }
    
    func ftConfigure(message: String) {
        ftIsHidden(false)
        ftText(message)
    }
    
    
}
