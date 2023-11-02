//
//  FTScrollStackView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTScrollStackView: UIView, FTViewableProtocol {
    
    // The scroll container
    let ftScrollView = UIScrollView()
    
    // The stack view container
    let ftStackView = FTStackView()
    
    private var shadowClippingMask: CALayer!
    private var shouldApplyShadowClippingMask = false
    
    init() {
        super.init(frame: .zero)

        ftScrollView.canCancelContentTouches = false
        ftScrollView.delaysContentTouches = true
        
        addSubview(ftScrollView)
        ftScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        ftScrollView.addSubview(ftStackView)
        ftStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
                        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shouldApplyShadowClippingMask {
            if shadowClippingMask != nil {
                shadowClippingMask.removeFromSuperlayer()
                shadowClippingMask = nil
            }
            
            shadowClippingMask = CALayer()
            shadowClippingMask.backgroundColor = UIColor.black.cgColor
            shadowClippingMask.frame = CGRect(
                x: -5,
                y: -5,
                width: ftScrollView.frame.width + 10,
                height: ftScrollView.frame.height + 10
            )
            
            layer.mask = shadowClippingMask
            
            ftScrollView.layer.masksToBounds = false
            ftStackView.layer.masksToBounds = false
        }
    }
    
    @discardableResult
    func ftClipsToBounds(_ clipsToBounds: Bool) -> Self {
        self.clipsToBounds = clipsToBounds
        ftScrollView.clipsToBounds = clipsToBounds
        ftStackView.clipsToBounds = clipsToBounds
        return self
    }
    
    @discardableResult
    func ftMasksToBounds(_ masksToBounds: Bool) -> Self {
        self.layer.masksToBounds = masksToBounds
        ftScrollView.layer.masksToBounds = masksToBounds
        ftStackView.layer.masksToBounds = masksToBounds
        return self
    }
    
    @discardableResult
    func ftShouldApplyShadowClippingMask(_ shouldApplyShadowClippingMask: Bool) -> Self {
        self.shouldApplyShadowClippingMask = shouldApplyShadowClippingMask
        return self
    }
    
    @discardableResult
    func ftAddArrangedSubview(_ view: UIView) -> Self {
        ftStackView.ftAddArrangedSubview(view)
        return self
    }
        
    @discardableResult
    func ftSpacing(_ spacing: CGFloat) -> Self {
        ftStackView.ftSpacing(spacing)
        return self
    }
    
    @discardableResult
    func ftSpacer(_ spacing: CGFloat) -> Self {
        ftStackView.ftSpacer(spacing)
        return self
    }
    
    @discardableResult
    func ftDistribution(_ distribution: UIStackView.Distribution) -> Self {
        ftStackView.ftDistribution(distribution)
        return self
    }
    
    @discardableResult
    func ftAlignment(_ alignment: UIStackView.Alignment) -> Self {
        ftStackView.ftAlignment(alignment)
        return self
    }
    
    @discardableResult
    func ftPadding(_ padding: CGFloat) -> Self {
        ftStackView.ftPadding(padding)
        return self
    }
    
    @discardableResult
    func ftPaddingVertical(_ padding: CGFloat) -> Self {
        ftStackView.ftPaddingVertical(padding)
        return self
    }
    
    @discardableResult
    func ftPaddingHorizontal(_ padding: CGFloat) -> Self {
        ftStackView.ftPaddingHorizontal(padding)
        return self
    }
    
    @discardableResult
    func ftPaddingTop(_ padding: CGFloat) -> Self {
        ftStackView.ftPaddingTop(padding)
        return self
    }
    
    @discardableResult
    func ftPaddingBottom(_ padding: CGFloat) -> Self {
        ftStackView.ftPaddingBottom(padding)
        return self
    }
    
    @discardableResult
    func ftPaddingLeading(_ padding: CGFloat) -> Self {
        ftStackView.ftPaddingLeading(padding)
        return self
    }
    
    @discardableResult
    func ftPaddingTrailing(_ padding: CGFloat) -> Self {
        ftStackView.ftPaddingTrailing(padding)
        return self
    }
        
    @discardableResult
    func ftBounces(_ isBounce: Bool) -> Self {
        ftScrollView.bounces = isBounce
        return self
    }
    
    @discardableResult
    func ftAlwaysBounceVertical(_ isBounce: Bool) -> Self {
        ftScrollView.alwaysBounceVertical = isBounce
        return self
    }
    
    @discardableResult
    func ftAlwaysBounceHorizontal(_ isBounce: Bool) -> Self {
        ftScrollView.alwaysBounceHorizontal = isBounce
        return self
    }
    
    @discardableResult
    func ftshowsVerticalScrollIndicator(_ isShow: Bool) -> Self {
        ftScrollView.showsVerticalScrollIndicator = isShow
        return self
    }
    
    @discardableResult
    func ftshowsHorizontalScrollIndicator(_ isShow: Bool) -> Self {
        ftScrollView.showsHorizontalScrollIndicator = isShow
        return self
    }
    
    @discardableResult
    func ftIsScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        ftScrollView.isScrollEnabled = isScrollEnabled
        return self
    }
    
    @discardableResult
    func ftIsPagingEnabled(_ isPagingEnabled: Bool) -> Self {
        ftScrollView.isPagingEnabled = isPagingEnabled
        return self
    }
    
    @discardableResult
    func ftContentInsetAdjustmentBehavior(_ contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior) -> Self {
        ftScrollView.contentInsetAdjustmentBehavior = .never
        return self
    }
    
    func ftScrollRectToVisible(_ rect: CGRect, animated: Bool) {
        ftScrollView.scrollRectToVisible(rect, animated: animated)
    }

}
