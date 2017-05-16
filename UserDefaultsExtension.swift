//
//  UserDefaultsExtension.swift
//  LoginGuide
//
//  Created by Yoel Lev on 5/16/17.
//  Copyright © 2017 Yoel Lev. All rights reserved.
//

import Foundation


extension UserDefaults {
    
    enum UserDefaultsKeys:String{
    
        case isLoggedIn
    }
    

    func setIsLoggedIn(value:Bool){
        set(true, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn()-> Bool{
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
}

