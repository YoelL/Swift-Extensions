

import Foundation

func delayOnMainThread(seconds: Double, action:(() -> ())!) {
    
    let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64( seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
        action()
    })
    
    let queue = DispatchQueue(label: "com.test.myqueue")
    queue.async {}
}

// This is a simple utilitly function to use if I ever want to delay an action, animation, or transition
// How it's used:

//delayOnMainThread(seconds: 1.5, action: {
//    dismissCustomAlert()
//    self.navigationController?.popViewController(animated: true)
//})

