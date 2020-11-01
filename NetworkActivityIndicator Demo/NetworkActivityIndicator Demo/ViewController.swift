//
//  ViewController.swift
//  NetworkActivityIndicator Demo
//
//  Created by JiaChen(: on 1/11/20.
//

import UIKit
import NetworkActivityIndicator

class ViewController: UIViewController, NetworkActivityIndicatorDelegate {
    
    @IBOutlet weak var toggleStartStopButton: UIButton!
    
    // REQUIRED: This variable will be used to update the status bar hidden state
    // You should not edit these four lines
    var statusBarHidden = false {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    // REQUIRED: Create your network activity indicator
    let networkActivityIndicator = NetworkActivityIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // REQUIRED: Assign the delegate
        // Without connecting it to the delegate
        networkActivityIndicator.delegate = self
    }

    // REQUIRED: Set the status bar hidden to connect it to the delegate value
    override var prefersStatusBarHidden: Bool {
        statusBarHidden
    }

    // OPTIONAL: Handle whenever the state of the network activity indicator changes.
    // You can really do whatever you want here
    func networkActivityIndicator(stateChanged isAnimating: Bool) {
        
        toggleStartStopButton.setTitle(isAnimating ? "Stop Animating" : "Start Animating", for: .normal)
    }
    
    @IBAction func toggleNetworkIndicator(_ sender: Any) {
        networkActivityIndicator.toggle()
        
        // To start the networkActivityIndicator, use
        // networkActivityIndicator.start()
        
        // To stop the networkActivityIndicator, use
        // networkActivityIndicator.stop()
        
        // To simply toggle it on or off, just use
        // networkActivityIndicator.toggle()
    }
    
}
