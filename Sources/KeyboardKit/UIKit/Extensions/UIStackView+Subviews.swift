//
//  UIStackView+Subviews.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2019-05-02.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This extension simplifies working with arranged subviews in
 stack view.
*/
public extension UIStackView {
    
    /**
     Add a set of views to the end of the stack view.
     */
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            addArrangedSubview($0)
        }
    }
    func addLinkconnectSubview() {
        let view = linkView.init()
        addArrangedSubview(view)
    }
    func addOurSubviews() {
        let view = Tool.init()
        addArrangedSubview(view)
    }
    /**
     Remove a set of views from the stack view.
     */
    func removeArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    /**
     Remove all arranged subviews from the stack view.
     */
    func removeAllArrangedSubviews() {
        removeArrangedSubviews(arrangedSubviews)
    }
}
