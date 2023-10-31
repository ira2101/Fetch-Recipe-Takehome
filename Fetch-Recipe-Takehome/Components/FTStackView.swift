//
//  FTStackView.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTStackView: UIStackView, RFViewableProtocol {
    
    private var isCapsulateCorners: Bool = false
    
    init() {
        super.init(frame: .zero)
        directionalLayoutMargins = .zero
        isLayoutMarginsRelativeArrangement = true
        translatesAutoresizingMaskIntoConstraints = false
        insetsLayoutMarginsFromSafeArea = false
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    //gets called when the size of a view changes
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isCapsulateCorners {
            layer.cornerRadius = frame.size.height / 2.0
        }
    }
    
    @discardableResult
    func ftCapsulateCorners() -> Self {
        isCapsulateCorners = true
        return self
    }
    
    @discardableResult
    func ftAddArrangedSubview(guaranteedAlignment: UIStackView.Alignment? = nil, _ view: UIView?) -> Self {
        guard let view = view else {
            return self
        }
        
        if let guaranteedAlignment = guaranteedAlignment {
            if let stackView = view as? FTStackView {
                stackView.axis == .vertical
                ? addArrangedSubview(
                    FTHStack()
                    .ftAddArrangedSubview(view)
                    .ftAlignment(guaranteedAlignment)
                )
                : addArrangedSubview(
                    FTVStack()
                    .ftAddArrangedSubview(view)
                    .ftAlignment(guaranteedAlignment)
                )

            } else {
                addArrangedSubview(
                    FTVStack()
                    .ftAddArrangedSubview(
                        FTHStack()
                        .ftAddArrangedSubview(view)
                        .ftAlignment(guaranteedAlignment)
                    )
                    .ftAlignment(guaranteedAlignment)
                )
            }
            
            return self
        }
        
        // When we are not guaranteeing alignment
        addArrangedSubview(view)
        
        return self
    }
        
    @discardableResult
    func ftSpacing(_ spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }
    
    @discardableResult
    func ftSpacer(_ spacing: CGFloat) -> Self {
        guard let view = self.arrangedSubviews.last else {
            return self
        }
        
        setCustomSpacing(spacing, after: view)
        
        return self
    }
    
    @discardableResult
    func ftDistribution(_ distribution: UIStackView.Distribution) -> Self {
        self.distribution = distribution
        return self
    }
    
    @discardableResult
    func ftAlignment(_ alignment: UIStackView.Alignment) -> Self {
        self.alignment = alignment
        return self
    }
    
}
