//
//  FTButton.swift
//  Fetch-Recipe-Takehome
//
//  Created by Ira Einbinder on 10/31/23.
//

import UIKit
import SnapKit

class FTButton: UIView, FTViewableProtocol, UIGestureRecognizerDelegate {
    
    private let kInteractedDisabledAlpha = 0.5
    private let kHighlightedAlpha = 0.75
    private let kRegularAlpha = 1.0
    private let kDistanceToVenture = 50.0
    
    private lazy var tapGesture = UITapGestureRecognizer(
        target: self,
        action: #selector(onTap(_:))
    )
    
    private lazy var longPressGesture = UILongPressGestureRecognizer(
        target: self,
        action: #selector(onLongPress(_:))
    )
    
    private var onPressCallback: (() -> ())?
    
    private var customHighlightCallback: ((FTButton, Bool) -> Void)?
        
    private var isHighlightedState = false {
        didSet {
            customHighlightCallback != nil
            ? customHighlightCallback!(self, isHighlightedState)
            : defaultHighlight(isHighlightedState)
        }
    }
        
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    private func setupView() {
        isUserInteractionEnabled = true
        
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
        tapGesture.delegate = self

        longPressGesture.cancelsTouchesInView = false
        longPressGesture.delaysTouchesBegan = false
        longPressGesture.delaysTouchesEnded = false
        longPressGesture.minimumPressDuration = 0.25
        addGestureRecognizer(longPressGesture)
        longPressGesture.delegate = self
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    func ftCustomHighlight(_ customHighlightCallback: @escaping (FTButton, Bool) -> Void) -> Self {
        self.customHighlightCallback = customHighlightCallback
        return self
    }
            
    @discardableResult
    func ftComponent(_ view: UIView) -> Self {
        addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        return self
    }
    
    @discardableResult
    func ftOnPress(_ todo: @escaping () -> Void) -> Self {
        onPressCallback = todo
        return self
    }
    
    @discardableResult
    func ftCancelsTouchesInView(_ cancelsTouchesInView: Bool) -> Self {
        tapGesture.cancelsTouchesInView = cancelsTouchesInView
        longPressGesture.cancelsTouchesInView = cancelsTouchesInView
        return self
    }
            
    @objc private func onLongPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            isHighlightedState = true
            return
        }
        
        if sender.state == .ended {
            isHighlightedState = false
            if isFingerInRange(sender) {
                performAction()
            }
            return
        }
        
        if sender.state == .failed {
            isHighlightedState = false
            return
        }
        
        isHighlightedState = isFingerInRange(sender)
    }
    
    private func defaultHighlight(_ isActive: Bool) {
        alpha = isActive ? kHighlightedAlpha : kRegularAlpha
    }
    
    @objc private func onTap(_ sender: UITapGestureRecognizer) {
        performAction()
    }
    
    private func performAction() {
        onPressCallback?()
    }
    
    private func isFingerInRange(_ sender: UILongPressGestureRecognizer) -> Bool {
        // get the center of the view
        let centerX = (self.bounds.minX + self.bounds.maxX) / 2.0
        let centerY = (self.bounds.minY + self.bounds.maxY) / 2.0
        let center = CGPoint(x: centerX, y: centerY)
        
        // get the location of the finger
        let location = sender.location(in: self)
        
        // find the distance between the finger and the center of the view
        let a = abs(center.x - location.x)
        let b = abs(center.y - location.y)
        let c = sqrt(pow(a, 2) + pow(b, 2))
        
        // We are giving a fixed distance that the finger moves, but if the view is
        // large, then that fixed number could be within the view. We want to make
        // sure that the fixed distance is from outside of the view. Let's get the
        // largest possible distance that the finger could travel inside the view
        // from the center and add the fixed number to that as padding.
        let padding = sqrt(pow(center.x, 2) + pow(center.y, 2))
        
        return c <= kDistanceToVenture + padding
    }
}
