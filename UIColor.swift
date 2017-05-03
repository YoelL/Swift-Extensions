//
//  UIColor.swift
//  
//
//  Created by Yoel Lev on 5/3/17.
//
//

import Foundation

extension UIColor{
    convenience init(r:CGFloat , g:CGFloat ,b:CGFloat) {
        self.init(red: r/255, green: g/255 ,blue: b/255, alpha:1)
    }
}
