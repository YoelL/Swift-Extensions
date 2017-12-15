
import Foundation
import UIKit

// I always have a colors stuct for all the cusom colors in my app
// How it's used: let backgroundColor = Colors.darkGrey

struct Colors {
    static let uReactRed    = UIColor(red: 231.0/255.0, green: 60.0/255.0, blue: 60.0/255.0, alpha: 1.0)
    static let darkGrey     = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1.0)
    static let veryDarkGrey = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)
    static let lightGrey    = UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1.0)
    static let white        = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    static let black        = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
}

// I put all my cell identifiers for Table/Collection Views in here as well
// How it's used: let cell = tableView.dequeueReusableCell(withIdentifier: Cells.reaction) as! ReactionCell

struct Cells {
    static let reaction             = "ReactionCell"
    static let addReaction          = "AddReactionCell"
    static let removeReaction       = "RemoveReactionCell"
}


// These next 2 structs work together, and it's how I adjust for screen size when necessary
// Most of the time auto-layout handles things, but sometimes to need a fine adjustment for one screen size
// How it's used:  If DeviceTypes.iPhone5 { // do iPhone5 specific stuff }

struct ScreenSize {
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceTypes {
    static let iPhone4              = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let iPhone5              = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let iPhone7Standard      = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0 && UIScreen.main.nativeScale == UIScreen.main.scale
    static let iPhone7Zoomed        = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0 && UIScreen.main.nativeScale > UIScreen.main.scale
    static let iPhone7PlusStandard  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let iPhone7PlusZoomed    = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0 && UIScreen.main.nativeScale < UIScreen.main.scale
    static let iPad                 = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    // Add iPad Pro 12inch, and iPad Mini
}


