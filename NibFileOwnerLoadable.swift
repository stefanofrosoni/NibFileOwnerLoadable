//
//  NibFileOwnerLoadable.swift
//
//  Created by Stefano Frosoni on 15/05/2017.
//  Copyright © 2017 Stefano Frosoni. All rights reserved.
//

import Foundation

/**
 ## NibFileOwnerLoadable Protocol
 * A UIView subclass can conform to this protocol when is used as the XIB's File's Owner.
 * The nib has the same name as the name of the class and is located in the bundle of that class
 */

public protocol NibFileOwnerLoadable: class {
    static var nib: UINib { get }
}

public extension NibFileOwnerLoadable where Self: UIView {

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }

    /**
     Returns a `UIView` object instantiated from nib
     */
    func instantiateFromNib() -> UIView? {
        let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view
    }

    /**
     * Load the content of the first view in the XIB.
     * Then add this as subview with constraints
     */
    func loadNibContent() {
        guard let view = instantiateFromNib() else {
            fatalError("Failed to instantiate nib \(Self.nib)")
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        let views = ["view": view]
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: .alignAllLastBaseline, metrics: nil, views: views)
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: .alignAllLastBaseline, metrics: nil, views: views)
        addConstraints(verticalConstraints + horizontalConstraints)
    }
}
