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
    func persistUser(_ persistObject:Any) {
        
        var userRawData = Data()
        
        let userData = NSKeyedArchiver.archivedData(withRootObject: persistObject as! UserCredentials)
        userRawData.append(userData)
        
        UserDefaults.standard.set(userRawData, forKey: userKey)
        UserDefaults.standard.synchronize()
    }
    
    func loadUser() {
        
        guard let storedUser = UserDefaults.standard.data(forKey: userKey) else { return }
        
        guard let user = NSKeyedUnarchiver.unarchiveObject(with: storedUser) as? UserCredentials else {return}
        
        print(user.userInfo())
        
    }
    
    func getUser()-> UserCredentials? {
        
        let user:UserCredentials? = nil
        
        if let storedUser = UserDefaults.standard.data(forKey: userKey) {
        
            if let  user = NSKeyedUnarchiver.unarchiveObject(with: storedUser) as? UserCredentials {
            
                return user
            }
        }
        return user
    }

   func deleteAllPersistedData(){

        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
    
    }
