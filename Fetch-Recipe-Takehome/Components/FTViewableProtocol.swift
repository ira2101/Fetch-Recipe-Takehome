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
    
}
