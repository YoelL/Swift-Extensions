

import Foundation
import UIKit

class Alert {
    
    class func showBasic(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}


// The start of an Alert class that goes in every project. This initial function is the standard alert
// I expand on this class as necessary with custom alerts or action sheets specific to the project

// How it's used:  Alert.showBasic(title: "Your title Here", message: "You message here", vc: self)
