//
//  FTToggleButton.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTToggleButton: FTButton {
    
    var ftIsActive: Bool = false {
        didSet {
            toggleButtonDidChangeStateCallback?(ftIsActive)
        }
    }
    
    private var toggleButtonDidChangeStateCallback: ((Bool) -> Void)?
    
    /// The default is to toggle automatically
    private var shouldToggleManually: Bool = false
    
    /// Use this to manually change the isActive state of the button to true or false
    func ftSetActive(_ isActive: Bool) {
        self.ftIsActive = isActive
    }
        
    /// Toggling can be done either manually or automatically
    @discardableResult
    func ftShouldToggleManually(_ shouldToggleManually: Bool) -> Self {
        self.shouldToggleManually = shouldToggleManually
        return self
    }
    
    /// Use this to observe when the button changes its isActive state to true or false
    @discardableResult
    func ftToggleButtonDidChangeState(_ toggleButtonDidChangeStateCallback: @escaping (Bool) -> Void) -> Self {
        self.toggleButtonDidChangeStateCallback = toggleButtonDidChangeStateCallback
        return self
    }
    
}
