//
//  NetworkActivityIndicatorDelegate.swift
//  ActivityIndicator
//
//  Created by JiaChen on 31/10/20.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

@objc public protocol NetworkActivityIndicatorDelegate {
    
    /// Used as a workaround to make the status bar hidden
    var statusBarHidden: Bool { get set }

    #if canImport(UIKit)
    var view: UIView! { get set }
    #endif
    
    /// Respond to a change in the animation state of the network activity indicator
    ///
    /// Basically, this code will run if it starts or stops animating
    ///
    /// - Parameter isAnimating: Whether it is animating or not.
    @objc optional func networkActivityIndicator(stateChanged isAnimating: Bool)
}

