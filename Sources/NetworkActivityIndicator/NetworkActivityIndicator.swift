//
//  NetworkActivityIndicator.swift
//  ActivityIndicator
//
//  Created by JiaChen on 31/10/20.
//

import UIKit

public class NetworkActivityIndicator {
    
    /// The object that acts as the delegate of the Network Activity Indicator
    open var delegate: NetworkActivityIndicatorDelegate? {
        didSet {
            if let delegate = delegate {
                setUp(delegate)
            }
        }
    }
    
    /// Used to check and to set if it the network activity indicator is animating
    ///
    /// You can simply set `isAnimating = true` to start animating
    /// or you can just use `isAnimating` to check if it is running.
    open var isAnimating: Bool = false {
        didSet {
            start(isAnimating)
        }
    }
    
    private let activityIndicator = UIActivityIndicatorView()
    
    private var hasTopNotch: Bool {
        if #available(iOS 11.0, tvOS 11.0, *) {
            let topInset = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
            return topInset > 24
        }
        return false
    }
    
    public init() {
        
    }
    
    public init(delegate: NetworkActivityIndicatorDelegate) {
        self.delegate = delegate
    }
    
    private func setUp(_ delegate: NetworkActivityIndicatorDelegate) {
        
        if hasTopNotch {
            
            let view = delegate.view!
            
            activityIndicator.hidesWhenStopped = true
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            activityIndicator.layer.zPosition = 100
            
            view.addSubview(activityIndicator)
            
            view.addConstraints([NSLayoutConstraint(item: activityIndicator,
                                                    attribute: .bottom,
                                                    relatedBy: .equal,
                                                    toItem: view,
                                                    attribute: .topMargin,
                                                    multiplier: 1,
                                                    constant: 0),
                                 NSLayoutConstraint(item: activityIndicator,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: view,
                                                    attribute: .top,
                                                    multiplier: 1,
                                                    constant: 0),
                                 NSLayoutConstraint(item: activityIndicator,
                                                    attribute: .leading,
                                                    relatedBy: .equal,
                                                    toItem: view,
                                                    attribute: .leading,
                                                    multiplier: 1,
                                                    constant: 48)])
        }
    }
    
    /// Start animating the network activity indicator
    public func start() {
        isAnimating = true
    }
    
    /// Stop animating the network activity indicator
    public func stop() {
        isAnimating = false
    }
    
    /// Starts or stops the network activity indicator based on its current state
    ///
    /// If it is animating, it will stop and vice-versa.
    public func toggle() {
        isAnimating.toggle()
    }
    
    /// Animate the network activity indicator
    /// - Parameter start: Whether to start or stop the network activity indicator
    func start(_ start: Bool) {
        if let delegate = delegate {
            
            DispatchQueue.main.async { [self] in
                
                if hasTopNotch {
                    
                    delegate.statusBarHidden = start
                    
                    if start {
                        
                        activityIndicator.startAnimating()
                        
                    } else {
                        
                        activityIndicator.stopAnimating()
                        
                    }
                                        
                } else {
                    
                    UIApplication.shared.isNetworkActivityIndicatorVisible = start
                    
                }
                
                delegate.networkActivityIndicator?(stateChanged: start)
            }
        } else {
            print("Network Activity Indicator will not appear as `NetworkActivityIndicatorDelegate` is not implemented.")
        }
    }
}
