//
//  FTImageComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTImageComponent: UIImageView {

    init() {
        super.init(frame: .zero)
    }
    
    @discardableResult
    func rtImage(_ image: UIImage) -> Self {
        self.image = image
        return self
    }

}
