//
//  FTSymbol.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit

class FTSymbol: UIImageView, FTViewableProtocol {
    
    enum FTSymbolPalette: String {
        case checkmark = "checkmark"
        
        case back = "chevron.backward"
    }
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    func ftColor(_ color: UIColor) -> Self {
        self.tintColor = color
        return self
    }
    
    @discardableResult
    func ftSymbol(_ symbol: FTSymbolPalette, textStyle: UIFont.TextStyle, weight: UIFont.Weight) -> Self {
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(
            withTextStyle: textStyle
        )
        
        let font = UIFont.systemFont(ofSize: fontDescriptor.pointSize, weight: weight)
        let scaledFont = fontMetrics.scaledFont(for: font)
        
        let config = UIImage.SymbolConfiguration(font: scaledFont)
        
        let image = UIImage(systemName: symbol.rawValue, withConfiguration: config)
        
        self.image = image
        
        return self
    }
    
}
