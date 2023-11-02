//
//  FTImageComponent.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTImageView: UIImageView, FTViewableProtocol {
    
    private var placeholderView: UIView?

    init() {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    func ftImage(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }
    
    @discardableResult
    func ftContentMode(_ contentMode: UIView.ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }
    
    @discardableResult
    func ftPlaceholder(_ view: UIView) -> Self {
        self.placeholderView = view
        
        addSubview(view)
        
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        return self
    }
    
    @discardableResult
    func ftShouldShowPlaceholder(_ shouldShowPlaceholder: Bool) -> Self {
        placeholderView?.isHidden = !shouldShowPlaceholder
        
        return self
    }
    
    

}
