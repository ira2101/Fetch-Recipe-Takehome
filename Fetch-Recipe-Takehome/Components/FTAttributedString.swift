//
//  FTAttributedString.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import Foundation
import UIKit

/// Make sure to call build()
class FTAttributedStringBuilder {
    var mutableAtributedString: NSMutableAttributedString = NSMutableAttributedString()
        
    @discardableResult
    func ftAppend(_ attributedString: NSAttributedString) -> Self {
        mutableAtributedString.append(attributedString)
        return self
    }
            
    @discardableResult
    func ftBuild() -> NSMutableAttributedString {
        return mutableAtributedString
    }
}

/// Make sure to call build()
class FTAttributedString {
    var text: String = ""
    var attributes: [NSAttributedString.Key: Any] = [:]
    
    @discardableResult
    func ftText(_ text: String) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    func ftFont(textStyle: UIFont.TextStyle, weight: UIFont.Weight) -> Self {
        attributes[.font] = FTFont(textStyle: textStyle, weight: weight).ftBuild()
        return self
    }
    
    @discardableResult
    func ftTextColor(_ color: UIColor) -> Self {
        self.attributes[.foregroundColor] = color
        return self
    }
    
    func ftBuild() -> NSAttributedString {
        return NSAttributedString(string: text, attributes: attributes)
    }
}

/// Make sure to call build()
class FTFont {
    var font: UIFont
    
    init(textStyle: UIFont.TextStyle, weight: UIFont.Weight) {
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle)
        let font = UIFont.systemFont(ofSize: fontDescriptor.pointSize, weight: weight)
        
        self.font = fontMetrics.scaledFont(for: font)
    }
    
    func ftBuild() -> UIFont {
        return font
    }
}
