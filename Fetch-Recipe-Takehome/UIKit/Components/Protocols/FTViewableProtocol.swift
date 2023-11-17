//
//  FTViewableProtocol.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

public protocol FTViewableProtocol: UIView {

}

extension FTViewableProtocol {
    
    @discardableResult
    func ftBackgroundColor(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }
    
    @discardableResult
    func ftBorder(width: CGFloat, color: UIColor) -> Self {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        return self
    }
    
    @discardableResult
    func ftCornerRadius(_ radius: CGFloat) -> Self {
        layer.cornerRadius = radius
        return self
    }
    
    @discardableResult
    func ftHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        setContentHuggingPriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    func ftCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    func ftWidth(_ width: CGFloat) -> Self {
        self.snp.makeConstraints { make in
            make.width.equalTo(width)
        }
        return self
    }
    
    @discardableResult
    func ftHeight(_ height: CGFloat) -> Self {
        self.snp.makeConstraints { make in
            make.height.equalTo(height)
        }
        return self
    }
    
    @discardableResult
    func ftShadow(color: UIColor, blur: CGFloat, offset: CGSize) -> Self {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = blur / 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        clipsToBounds = false
        
        return self
    }
    
    @discardableResult
    func ftIsHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func ftClipsToBounds(_ clipsToBounds: Bool) -> Self {
        self.clipsToBounds = clipsToBounds
        return self
    }
    
    @discardableResult
    func ftAlpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    
}
