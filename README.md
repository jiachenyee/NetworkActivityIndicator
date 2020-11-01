# Network Activity Indicator

This is a simple package that shows network activity indicator, regardless of whether the device has a notch or not

---

## Implementation
```swift
import NetworkActivityIndicator

// REQURIRED: Add the NetworkActivityIndicatorDelegate protocol
class ViewController: UIViewController, NetworkActivityIndicatorDelegate { 

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
        // your code
    }
}
```

## Why?
The old network activity indicator was deprecated and would not show up on devices with a notch. Therefore, I created a replacement.
